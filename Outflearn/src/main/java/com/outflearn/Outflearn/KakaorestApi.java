package com.outflearn.Outflearn;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;



public class KakaorestApi {
	
	public JsonNode getAccessToken(String autorize_code) {
		 
        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
 
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
 
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
 
        postParams.add(new BasicNameValuePair("client_id", "9f6c1329ee4a39b9c5af5db66282c4ba"));
 
        postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8787/Outflearn/oauth"));
 
        postParams.add(new BasicNameValuePair("code", autorize_code));
 
        final HttpClient client = HttpClientBuilder.create().build();
 
        final HttpPost post = new HttpPost(RequestUrl);
 
        JsonNode returnNode = null;
 
        try {
 
            post.setEntity(new UrlEncodedFormEntity(postParams));
 
            final HttpResponse response = client.execute(post);
 
            ObjectMapper mapper = new ObjectMapper();
 
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
 
            e.printStackTrace();
 
        } catch (ClientProtocolException e) {
 
            e.printStackTrace();
 
        } catch (IOException e) {
 
            e.printStackTrace();
 
        } finally {
 
        }
 
        return returnNode;
 
    }
	
	
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		
		System.out.println(accessToken);
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		
		//add header		
		post.addHeader("Authorization", "Bearer " + accessToken);
		
		JsonNode returnNode = null;
		
		try {
			
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			System.out.println("\nsending'POST' request to URL : "+RequestUrl);
			System.out.println("Response Code: " + responseCode);
			
			//Json 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			System.out.println("returnNode: "+returnNode);
		}catch (ClientProtocolException e) {
		
			e.printStackTrace();
		} catch (IOException e) {
		
			e.printStackTrace();
		}finally {
		//	clear resources
		}		
		return returnNode;
		
	}



}
