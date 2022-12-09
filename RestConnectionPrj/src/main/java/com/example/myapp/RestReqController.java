package com.example.myapp;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class RestReqController {	

	 @RequestMapping("/req_form")
	   public String testRestRequestImage(Model model) {
	         try {
	            URL url = new URL("http://192.168.111.128:5000/test1");
	            HttpURLConnection con = (HttpURLConnection) url.openConnection();
	            //해당 URL에 요청을 해줄 작은 브라우저를 만들어준다.
	            con.setRequestMethod("GET");
	            InputStream in = con.getInputStream();
	            InputStreamReader reader = new InputStreamReader(in, "UTF-8");
	            BufferedReader response = new BufferedReader(reader);
	            String str = null;
	            StringBuffer buff = new StringBuffer();
	            int i =0;
	            while((str = response.readLine()) != null) {
	               	buff.append(str + "\n");
	            }
	            String data = buff.toString();    
	            
	            HashMap<String, String> msgMap = new HashMap<String, String>();
	            JSONParser parser = new JSONParser();
	            JSONObject json = (JSONObject) parser.parse(data);
	            int jsonSize = json.size();
	            Collection<String> msg = json.values();
	            model.addAttribute("reqResult",   msg);	            
	            
	            
	            /*System.out.println("data:" + data);
	            System.out.println("reqResult:" + data);
	            model.addAttribute("reqResult", data);          
	            
	            String truncated = data.substring(6, 8);
	            System.out.println(truncated);
	            
	            String truncated2 = data.substring(15, 20);
	            System.out.println(truncated2);
	            System.out.println("분리");
	            */
	            
	            
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         return "req_form";
	      }

}
