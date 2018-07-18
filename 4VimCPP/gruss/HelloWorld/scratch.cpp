
    size_t size_to_allocate = 1024;
    int megs_obtained = 0;
    while (megs_obtained < 512) {
        some_memory = (char *)malloc(size_to_allocate);
        if (some_memory != NULL) {
            megs_obtained++;
            sprintf(some_memory, "Hello World");
            printf("%s − now allocated %d Megabytes\n", some_memory, megs_obtained);
        }
        else {
            exit(EXIT_FAILURE);
        }
    }
    exit(EXIT_SUCCESS);
    // declaring variables:
    int a, b;
    int result;
    // process:
    a = 5;
    b = 2;
    a = b + a;
    result = a ;
    // terminate the program:
    printf("%s − now allocated \n", result);
    return result;
