#include <iostream>
#include <pthread.h>
#include <unistd.h>

using namespace std;
pthread_mutex_t lock_mutex;
pthread_cond_t c1, c2, c3;

int turn = 1;

#define REPEAT 10

void* print1(void* arg) {
    while(1) {
        pthread_mutex_lock(&lock_mutex);
        
        while (turn != 1) {
            pthread_cond_wait(&c1, &lock_mutex);
        }
        
        cout << "1 " << flush;
        turn = 2;
        
        pthread_cond_broadcast(&c2);
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

void* print2(void* arg) {
    while(1) {
    pthread_mutex_lock(&lock_mutex);
        
        while (turn != 2) {
            pthread_cond_wait(&c2, &lock_mutex);
        }
        
        cout << "2 " << flush;
        turn = 3;
        
        pthread_cond_broadcast(&c3); 
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

void* print3(void* arg) {
    while(1) {
        pthread_mutex_lock(&lock_mutex);
        
        while (turn != 3) {
            pthread_cond_wait(&c3, &lock_mutex);
        }
        
        cout << "3 " << flush;
        turn = 1; 
        
        pthread_cond_broadcast(&c1); 
        pthread_mutex_unlock(&lock_mutex);
    }
    return NULL;
}

int main() {
    pthread_t t1, t2, t3;
    pthread_create(&t1, NULL, print1, NULL);
    pthread_create(&t2, NULL, print2, NULL);
    pthread_create(&t3, NULL, print3, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);

    printf("\n");
    return 0;
}
