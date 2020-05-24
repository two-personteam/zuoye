package com.itshidu.jeelite.common.oss;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;

import org.apache.commons.io.FileUtils;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.GeneratePresignedUrlRequest;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.auth.sts.AssumeRoleRequest;
import com.aliyuncs.auth.sts.AssumeRoleResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.http.ProtocolType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

import net.sf.json.JSONObject;

public class OssService {
	
	public static String accessKeyId = null;
	public static String accessKeySecret = null;
	public static String roleArn = null;
	public static long durationSeconds = 0;
	public static String policy = null;
	public static String region = null;
	public static String roleSessionName = null;

	private static Properties prop = new Properties();
	private static File file = null;
	private static long lastModified = 0;


	public static void loadConfig() throws Exception {
		file = getFileByClasspath("oss/sts.properties");
		if (file.lastModified() != lastModified) {
			lastModified = file.lastModified();
			prop.clear();
			prop.load(new FileInputStream(file));
			accessKeyId = prop.getProperty("AccessKeyID");
			accessKeySecret = prop.getProperty("AccessKeySecret");
			roleArn = prop.getProperty("RoleArn");
			policy = prop.getProperty("PolicyFile");
			durationSeconds = Long.parseLong(prop.getProperty("TokenExpireTime"));
			String policyPath = prop.getProperty("PolicyFile");
			policy = FileUtils.readFileToString(getFileByClasspath(policyPath),"UTF-8");
			region = prop.getProperty("Region");
			roleSessionName = prop.getProperty("RoleSessionName");
		}
	}

	// 当前 STS API 版本
	public static final String STS_API_VERSION = "2015-04-01";

	private static AssumeRoleResponse assumeRole(String accessKeyId, String accessKeySecret, String roleArn,
			String roleSessionName, String policy, ProtocolType protocolType, long durationSeconds) throws ClientException {
		// 创建一个 Aliyun Acs Client, 用于发起 OpenAPI 请求
		IClientProfile profile = DefaultProfile.getProfile(region, accessKeyId, accessKeySecret);
		DefaultAcsClient client = new DefaultAcsClient(profile);
		// 创建一个 AssumeRoleRequest 并设置请求参数
		final AssumeRoleRequest request = new AssumeRoleRequest();
		request.setVersion(STS_API_VERSION);
		request.setMethod(MethodType.POST);
		request.setProtocol(protocolType);
		request.setDurationSeconds(durationSeconds);
		request.setRoleArn(roleArn);
		request.setRoleSessionName(roleSessionName);
		request.setPolicy(policy);
		return client.getAcsResponse(request);
	}
	
	private static File getFileByClasspath(String path) {
		return new File( OssService.class.getClassLoader().getResource(path).getFile() );
	}
	
	/**
	 * 生成签名，可以用来上传文件
	 * @return
	 * @throws Exception
	 */
	public static String execute() throws Exception {
		loadConfig();
		ProtocolType protocolType = ProtocolType.HTTPS; // 此处必须为 HTTPS
		try {
			final AssumeRoleResponse stsResponse = assumeRole(accessKeyId, accessKeySecret, roleArn, roleSessionName,policy, protocolType, durationSeconds);
			Map<String, String> respMap = new LinkedHashMap<String, String>();
			respMap.put("status", "200");
			respMap.put("AccessKeyId", stsResponse.getCredentials().getAccessKeyId());
			respMap.put("AccessKeySecret", stsResponse.getCredentials().getAccessKeySecret());
			respMap.put("SecurityToken", stsResponse.getCredentials().getSecurityToken());
			respMap.put("Expiration", stsResponse.getCredentials().getExpiration());
			return JSONObject.fromObject(respMap).toString();
		} catch (ClientException e) {
			Map<String, String> respMap = new LinkedHashMap<String, String>();
			respMap.put("status", e.getErrCode());
			respMap.put("AccessKeyId", "");
			respMap.put("AccessKeySecret", "");
			respMap.put("SecurityToken", "");
			respMap.put("Expiration", "");
			return  JSONObject.fromObject(respMap).toString();
		}
	}

	public static void main(String[] args) throws Exception {

		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			public void run() {
				try {
					//System.out.println("---------------");
					String x = execute();
					//System.out.println(x);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}, 0, 3000);
		
		execute();
		
		String endpoint = "oss-cn-beijing.aliyuncs.com";
		String bucket = "snxy";
		String key = "img/a237b354-9a3c-4482-a6ae-f02708f8d9f6_scaled.jpg";
		OSSClient client = new OSSClient(endpoint, accessKeyId, accessKeySecret);
		Date expires = new Date (new Date().getTime() + 1000 * 60); // 1 minute to expire
		GeneratePresignedUrlRequest generatePresignedUrlRequest = new GeneratePresignedUrlRequest(bucket, key);
		generatePresignedUrlRequest.setExpiration(expires);
		URL url = client.generatePresignedUrl(generatePresignedUrlRequest);
		System.out.println(url.toString());
		
	}
}
