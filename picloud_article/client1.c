/* This part of the client invokes the REST API of
   PiCloud and retrieves the Job ID
   http://docs.picloud.com/rest.html#invoking-functions
*/

#include <stdio.h>
#include <curl/curl.h>

int main(void)
{
  CURL *curl;

  /* Make sure you set this appropriately*/
  char *url="https://api.picloud.com/r/3222/square_func/";
  CURLcode res;
  
  curl = curl_easy_init();
  if(curl) {
    /* First set the URL that is about to receive our POST. This URL can
       just as well be a https:// URL if that is what should receive the
       data. */
    curl_easy_setopt(curl, CURLOPT_URL, url);
    /* Specify the user/pass */
    curl_easy_setopt(curl,CURLOPT_USERPWD,"3244:8823b533ef41975505c8dbe46a2f85b930428944");
    
    /* Now specify the POST data */
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, "x=5");
    
    /* For HTTPS */
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);

    /* Perform the request, res will get the return code */
    res = curl_easy_perform(curl);
    printf("\nResult of Operation:: %d\n", res);

    /* always cleanup */
    curl_easy_cleanup(curl);
  }
  return 0;
}
