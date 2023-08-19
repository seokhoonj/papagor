# NAVER Papago Language Detection API
import urllib.request
import json

class Detector:
    '''papago translator'''
    def __init__(self, client_id, client_secret, platform = False):
        self.client_id = client_id
        self.client_secret = client_secret
        self.platform = platform
        
    def detect_language(self, text):
        '''
        Client ids and secrets of text translation and 
        language detection are different.
        '''
        encQuery = urllib.parse.quote(text)
        data = "query=" + encQuery
        if self.platform:
            url = "https://naveropenapi.apigw.ntruss.com/langs/v1/dect"
            request = urllib.request.Request(url)
            request.add_header("X-NCP-APIGW-API-KEY-ID", self.client_id)
            request.add_header("X-NCP-APIGW-API-KEY", self.client_secret)
        else:
            url = "https://openapi.naver.com/v1/papago/detectLangs"
            request = urllib.request.Request(url)
            request.add_header("X-Naver-Client-Id", self.client_id)
            request.add_header("X-Naver-Client-Secret", self.client_secret)
        response = urllib.request.urlopen(request, data = data.encode("utf-8"))
        rescode = response.getcode()
        if (rescode == 200):
            response_body = response.read()
            response_body = response_body.decode('utf-8')
            response_json = json.loads(response_body)
            detected_language = response_json["langCode"]
        else:
            detected_language = "Error Code:" + rescode
        return detected_language
