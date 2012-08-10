/* This part of the client retrieves the result given the
   job ID as the argument*/
#include <stdio.h>
#include <stdlib.h>
#include <curl/curl.h>

int main(int argc, char *argv[])
{
  CURL *curl;
  char url[80];
  CURLcode res;

  if (argc==1)
    {
      printf("Usage: ./client2 <jid>\n");
      exit(0);
    }

  
  strcpy(url,"https://api.picloud.com/job/result/?jid=");
  strcat(url,argv[1]);

  

  curl = curl_easy_init();
  if(curl) {
    /* First set the URL that is about to receive our POST. This URL can
       just as well be a https:// URL if that is what should receive the
       data. */
    curl_easy_setopt(curl, CURLOPT_URL, url);
    
    /* Specify the user/pass */
    curl_easy_setopt(curl,CURLOPT_USERPWD,"3244:8823b533ef41975505c8dbe46a2f85b930428944");
    
    /* for HTTPS */
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
    
    /* Perform the request, res will get the return code */
    res = curl_easy_perform(curl);
    printf("\nResult of Operation:: %d\n", res);

    /* always cleanup */
    curl_easy_cleanup(curl);
  }
  return 0;
}
