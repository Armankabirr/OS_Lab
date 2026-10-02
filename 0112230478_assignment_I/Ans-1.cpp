#include <iostream>
#include <pthread.h>
#include <unistd.h>
using namespace std;

int counter = 0;
pthread_mutex_t lock;
pthread_cond_t c1, c2;

void *incrementer(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&lock);
        while(counter>0)
            pthread_cond_wait(&c1, &lock);
        for(int i=0; i<3; i++){
            cout << counter << " ";
            counter++;

        }
        pthread_cond_signal(&c2);
        pthread_mutex_unlock(&lock);
        usleep(1200);
    }
    return NULL;
    }
    

void *decrementer(void *arg)
{
    while (1)
    {
        pthread_mutex_lock(&lock);
        while(counter<3)
            pthread_cond_wait(&c2, &lock);
        for(int i=0; i<3; i++){
            cout<<counter<<" ";
            counter--;
        }
        pthread_cond_signal(&c1);
        pthread_mutex_unlock(&lock);
        usleep(1200);
    }
    return NULL;
}

int main()
{
    pthread_t t1, t2;
    pthread_create(&t1, NULL, incrementer, NULL);
    pthread_create(&t2, NULL, decrementer, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    return 0;
}
