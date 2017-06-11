package com.mall.daoimpl;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

public class TelValidate {

	public static void sendRegisterCode(String phoneNUm,int randomNum){
		try{
			String url = "http://gw.api.taobao.com/router/rest";
			String appkey = "23967882";
			String secret = "207025557de10bf1655322574d7fc350";
			TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
			AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
			req.setExtend( "" );
			req.setSmsType( "normal" );
			req.setSmsFreeSignName( "萌宠" );
			req.setSmsParamString( "{name:'"+randomNum+"'}" );
			req.setRecNum( phoneNUm );
			req.setSmsTemplateCode( "SMS_70530280" );
			AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
			System.out.println(rsp.getBody());
		}catch(ApiException e){
			e.printStackTrace();
		}
		
	}

}
