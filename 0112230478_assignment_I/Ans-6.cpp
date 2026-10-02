#include <iostream>
#include <pthread.h>
#include <unistd.h>
using namespace std;

pthread_mutex_t lock_mutex ;
pthread_cond_t c1;

int X, Y;

bool has_X = false;
bool has_Y = false;

void *genX(void *)
{
    while (true)
    {
       pthread_mutex_lock(&lock_mutex);

        while (has_X)
        {
            pthread_cond_wait(&c1, &lock_mutex);
        }

        X = rand() % 10 + 1; // Generate random number between 1 and 10
        cout << "X: " << X << endl;
        has_X = true;

        pthread_cond_broadcast(&c1); 
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

void *genY(void *)
{
    while (true)
    {
       pthread_mutex_lock(&lock_mutex);

        
        while (has_Y)
        {
            pthread_cond_wait(&c1, &lock_mutex);
        }

        Y = rand() % 10 + 1; // Generate random number between 1 and 10
        cout << "Y: " << Y << endl;
        has_Y = true;

        pthread_cond_broadcast(&c1); 
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

void *summer(void *)
{
    while (true)
    {
        pthread_mutex_lock(&lock_mutex);

        while (!has_X || !has_Y)
        {
            pthread_cond_wait(&c1, &lock_mutex);
        }

        cout << "Sum: " << (X + Y) << endl;

        has_X = false;
        has_Y = false;

        pthread_cond_broadcast(&c1); 
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

int main()
{
    pthread_t t1, t2, t3;

    pthread_create(&t1, NULL, genX, NULL);
    pthread_create(&t2, NULL, genY, NULL);
    pthread_create(&t3, NULL, summer, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);

    return 0;
}
