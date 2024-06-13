// write a pthread thread leak example
#include <pthread.h>
#include <stdlib.h>

void *thread_func(void *arg) {
  return NULL;
}

int main() {
  pthread_t t;
  pthread_create(&t, NULL, thread_func, NULL);
  // pthread_join(t, NULL);
  return 0;
}
