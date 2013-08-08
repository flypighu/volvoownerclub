package com.hux.frame.util.encrypt;

import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
/**
 * 
 * 调用java自带 的加密，解密算法，方法是 TripleDES
 *
 */
public class TripleDes {
	//加密方法 TripleDES 
	private static final String Algorithm = "TripleDES";
	//TripleDES 的加密密钥 长度是 24
	private static final byte[] defaultKey = "#o$dk3921-@#swq9dwfaqa!s".getBytes();
	
	static{
		Security.addProvider(new com.sun.crypto.provider.SunJCE());      
	}
	
	// keybyte为加密密钥，长度为24字节
	// src为被加密的数据缓冲区（源）
	private static byte[] encryptMode(byte[] keybyte, byte[] src) {
		try {
			// 生成密钥
			SecretKey deskey = new SecretKeySpec(keybyte, Algorithm);
			// 
			Cipher c1 = Cipher.getInstance(Algorithm);
			c1.init(Cipher.ENCRYPT_MODE, deskey);
			return c1.doFinal(src);
		} catch (java.security.NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		} catch (javax.crypto.NoSuchPaddingException e2) {
			e2.printStackTrace();
		} catch (Exception e3) {
			e3.printStackTrace();
		}
		return null;
	}

	// keybyte为加密密钥，长度为24字节
	// src为加密后的缓冲区
	private static byte[] decryptMode(byte[] keybyte, byte[] src) {
		try {
			// 生成密钥
			SecretKey deskey = new SecretKeySpec(keybyte, Algorithm);
			// 解密
			Cipher c1 = Cipher.getInstance(Algorithm);
			c1.init(Cipher.DECRYPT_MODE, deskey);
			return c1.doFinal(src);
		} catch (java.security.NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		} catch (javax.crypto.NoSuchPaddingException e2) {
			e2.printStackTrace();
		} catch (Exception e3) {
			e3.printStackTrace();
		}
		return null;
	}
	

	private static byte uniteBytes(char c1,char c2) {
		return uniteBytes(String.valueOf(c1),String.valueOf(c2));
	}
	
	private static byte uniteBytes(String s1,String s2){
		byte b0 = Byte.decode("0x"+s1).byteValue();  
		b0 = (byte) (b0<<4);//左移4位 相对于 10进制  乘16，16进制 进一位
		byte b1 = Byte.decode("0x"+s2).byteValue();
		byte rebyte = (byte)(b0|b1);
		return rebyte;		
	}
	
	/**
	 *  转换成十六进制字符串
	 * @param b
	 * @return
	 */
	public static String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
		}
		return hs.toUpperCase();
	}
	/**
	 * 16进制字符串 转为 byte[]
	 * @param hex
	 * @return
	 */
	public static byte[] hex2bytes(String hex) {
		if (hex.length() % 2 != 0){
			return null;
		}	
		byte[] rebyte = new byte[hex.length()/2];
		for (int i=0;i<rebyte.length;i++){
			rebyte[i] = uniteBytes(hex.charAt(i*2),hex.charAt((i+1)*2-1));
		}
		return rebyte;
	}
	/**
	 *  加密 转为 16进制的字符串
	 * @param src
	 * @param key key为空用则用默认的加密密钥
	 * @return
	 */
	public static String encrypt(String src, String key) {
		String hexsec = null;
		if (key != null) {
			byte[] keys = key.getBytes();
			byte[] secbyte = encryptMode (keys,src.getBytes());
			hexsec = byte2hex(secbyte);
		} else {
			byte[] secbyte = encryptMode (defaultKey,src.getBytes());
			hexsec = byte2hex(secbyte);			
		}
		return hexsec;
		
	}
	/**
	 * 解密16进制密文
	 * @param hexsec
	 * @param key key为空用则用默认的加密密钥
	 * @return
	 */
	public static String decrypt(String hexsec, String key) {
		byte[] sec = hex2bytes(hexsec);
		String src = null;
		if (key!= null) {
			byte[] keys = key.getBytes();	
			byte[] srcbyte = decryptMode(keys, sec);
			src = new String(srcbyte);
		} else {
			byte[] srcbyte = decryptMode(defaultKey, sec);
			src = new String(srcbyte);		
		}
		return src;
	}

    public static void main(String[] args) {
        System.out.println(TripleDes.decrypt(null,null));
    }

}