#include <memory.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
   fprintf(stderr, "\ndouble-free\n");
   char* theString = strdup("This is a string");
   free(theString);
   free(theString);

   fprintf(stderr, "Done.\n");
   return 0;
}