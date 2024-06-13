// write a data race example by using pthread
#include <pthread.h>
#include <stdlib.h>

int Global;

void *thread_func(void *arg) {
  Global++;
  return NULL;
}

int main() {
  pthread_t t;
  pthread_create(&t, NULL, thread_func, NULL);
  Global--;
  pthread_join(t, NULL);
  return 0;
}