# NAVER Papago Text Translation API
import urllib.request
import json
import numpy as np
import pandas as pd
from numbers import Number

class Translator:
    '''papago translator'''
    def __init__(self, client_id, client_secret, source, target, platform = False):
        self.client_id = client_id
        self.client_secret = client_secret
        self.source = source
        self.target = target
        self.platform = platform

    def translate_text(self, text):
        '''simple translator'''
        text = urllib.parse.quote(text)
        hold = "source={source}&target={target}&text={text}"
        data = hold.format(source = self.source, target = self.target, text = text)
        if self.platform:
            url = "https://naveropenapi.apigw.ntruss.com/nmt/v1/translation"
            request = urllib.request.Request(url)
            request.add_header("X-NCP-APIGW-API-KEY-ID", self.client_id)
            request.add_header("X-NCP-APIGW-API-KEY", self.client_secret)
        else:
            url = "https://openapi.naver.com/v1/papago/n2mt"
            request = urllib.request.Request(url)
            request.add_header("X-Naver-Client-Id", self.client_id)
            request.add_header("X-Naver-Client-Secret", self.client_secret)
        response = urllib.request.urlopen(request, data = data.encode("utf-8"))
        rescode = response.getcode()
        if (rescode == 200):
            response_body = response.read().decode('utf-8')
            response_json = json.loads(response_body)
            translated_text = response_json["message"]["result"]["translatedText"]
        else:
            translated_text = "Error Code:" + rescode
        return translated_text

    def translate(self, texts):
        '''generalized translator'''
        if isinstance(texts, Number):
            translated = texts
        if isinstance(texts, str):
            translated = self.translate_text(text = texts)
        if isinstance(texts, (list, np.ndarray, pd.Series)):
            translated = []
            for text in texts:
                if isinstance(text, Number):
                    translated_text = text
                elif pd.notna(text):
                    text = urllib.parse.quote(text)
                    hold = "source={source}&target={target}&text={text}"
                    data = hold.format(source = self.source, target = self.target, text = text)
                    if self.platform:
                        url = "https://naveropenapi.apigw.ntruss.com/nmt/v1/translation"
                        request = urllib.request.Request(url)
                        request.add_header("X-NCP-APIGW-API-KEY-ID", self.client_id)
                        request.add_header("X-NCP-APIGW-API-KEY", self.client_secret)
                    else:
                        url = "https://openapi.naver.com/v1/papago/n2mt"
                        request = urllib.request.Request(url)
                        request.add_header("X-Naver-Client-Id", self.client_id)
                        request.add_header("X-Naver-Client-Secret", self.client_secret)
                    response = urllib.request.urlopen(request, data = data.encode("utf-8"))
                    rescode = response.getcode()
                    if (rescode == 200):
                        response_body = response.read().decode('utf-8')
                        response_json = json.loads(response_body)
                        translated_text = response_json["message"]["result"]["translatedText"]
                    else:
                        translated_text = "Error Code:" + rescode
                else:
                    translated_text = np.nan
                translated.append(translated_text)
        return translated

    def translate_data(self, data, columns, keep_columns):
        '''translate data'''
        if keep_columns:
            if not isinstance(columns, list): columns = [columns]
            data_source = data[columns]
            data_target = data_source.apply(lambda x: self.translate(texts = x))
            data_target.columns = [col + "_" + self.target for col in columns]
            data = pd.concat([data_source, data_target], axis = 1)
            column_order = []
            for i, _ in enumerate(data_source.columns):
                column_order.append(data_source.columns[i])
                column_order.append(data_target.columns[i])
            data = data[column_order]
        else:
            data[columns] = data[columns].apply(lambda x: self.translate(texts = x))
        return data

    def translate_data_unique(self, data, columns):
        '''translate unique data to reduce the text size'''
        if not isinstance(columns, list): columns = [columns]
        unique_data = []
        translated = []
        for _, column in enumerate(columns):
            unique_column_data = list(data[column].unique())
            print(unique_column_data)
            if np.nan in unique_column_data:
                unique_column_data.remove(np.nan)
            unique_data.append(unique_column_data)
            translated_text = self.translate(texts = unique_column_data)
            translated.append(translated_text)
        translated_data = pd.DataFrame()
        for i, _ in enumerate(columns):
            translated_data = pd.concat([
                translated_data,
                pd.DataFrame({
                  columns[i] : unique_data[i],
                  columns[i] + '_' + self.target: translated[i]
                })], axis = 1)
        return translated_data

    def read_sheets(path):
        return [sht for sht in pd.read_excel(
            path, sheet_name = None, skiprows = 0, engine = 'openpyxl').keys()]

    def save_xlsx(data, sheets, path):
        writer = pd.ExcelWriter(path)
        for i, d in enumerate(data):
            d.to_excel(writer, sheet_name = f'{sheets[i]}', index = False)
        writer.save()
