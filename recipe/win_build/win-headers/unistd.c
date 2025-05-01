
char* convertEnv(const char* s1, const char* s2)
{
    char* result;
    strcpy(result, s1);
    strcat(result, "=");
    strcat(result, s2);
    return result;
}
