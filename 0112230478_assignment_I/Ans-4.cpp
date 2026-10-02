#include <iostream>
#include <pthread.h>
#include <unistd.h>
using namespace std;

pthread_mutex_t lock_mutex ;
pthread_cond_t c1, c2;

int counter = 1;

void *onlyThreeMultiple(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&lock_mutex);

        while (counter % 3 != 0)
        {
            pthread_cond_wait(&c1, &lock_mutex);
        }

        printf("%d  (printed by Thread-1)\n", counter);
        counter++;

        pthread_cond_signal(&c2);
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

void *otherNumbers(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&lock_mutex);

        while (counter % 3 == 0)
        {
            pthread_cond_wait(&c2, &lock_mutex);
        }

        printf("%d\n", counter);
        counter++;

        pthread_cond_broadcast(&c1);
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

int main()
{
    pthread_t t1, t2;
    pthread_create(&t1, NULL, onlyThreeMultiple, NULL);
    pthread_create(&t2, NULL, otherNumbers, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    return 0;
}
