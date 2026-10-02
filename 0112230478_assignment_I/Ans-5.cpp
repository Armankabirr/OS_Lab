#include <iostream>
#include <pthread.h>
#include <unistd.h>
using namespace std;

pthread_mutex_t lock_mutex ;
pthread_cond_t c1, c2;

#define THRESHOLD 15

int sum = 0;

void *thread1(void *)
{
    while (true)
    {
        pthread_mutex_lock(&lock_mutex);

        while (sum > THRESHOLD)
        {
            pthread_cond_wait(&c1, &lock_mutex);
        }

        int num = rand() % 10 + 1; // Generate random number between 1 and 10
        sum += num;
        cout << "Generated: " << num << ", Sum: " << sum << endl;

        
        if (sum > THRESHOLD)
        {
            cout << "Exceeds threshold " << THRESHOLD << endl;
            pthread_cond_signal(&c2); 
        }

        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

void *thread2(void *)
{
    while (true)
    {
        pthread_mutex_lock(&lock_mutex);

        while (sum <= THRESHOLD)
        {
            pthread_cond_wait(&c2, &lock_mutex);
        }

        sum = 0;

        pthread_cond_signal(&c1); 
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}


int main()
{
    pthread_t t1, t2;

    pthread_create(&t1, NULL, thread1, NULL);
    pthread_create(&t2, NULL, thread2, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    return 0;
}
