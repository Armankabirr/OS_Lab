#include <iostream>
#include <pthread.h>
#include <unistd.h>
#include <cstdlib>
#include <ctime>

using namespace std;

int number = 0;
bool is_generated = false;
pthread_mutex_t lock_mutex;
pthread_cond_t c1, c2;

void *generator(void *)
{
    while (true)
    {
        while (is_generated)
        {
            pthread_cond_wait(&c1, &lock_mutex);
        }
        number = rand() % 10 + 1; // to generate a random number between 1 and 10
        cout << "Generated: " << number << endl;

        is_generated = true; // Signal that a new number is available

        pthread_cond_signal(&c2); // Wake up the summer thread
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

void *summer(void *)
{
    int sum = 0;
    while (true)
    {
        pthread_mutex_lock(&lock_mutex);

        while (!is_generated)
        {
            pthread_cond_wait(&c2, &lock_mutex);
        }

        sum += number; 
        cout << "Sum: " << sum << endl;

        is_generated = false; 

        pthread_cond_signal(&c1); 
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

int main()
{
    pthread_t t1, t2;

    pthread_create(&t1, NULL, generator, NULL);
    pthread_create(&t2, NULL, summer, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    return 0;
}
