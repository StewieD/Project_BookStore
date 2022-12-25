package util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.tomcat.util.codec.binary.Base64;

public class MaHoa {
	// md5 
	// sha-1 => thuong duoc su dung
	public static String toSHA1(String toEncrypt) {
		 	String salt = "fE4wd#u*d9b9kdKszgè02ep5à4qZa!éi6";
		    String res = null;
		    toEncrypt = toEncrypt + salt;
		    try {
		        byte[] dataBytes = toEncrypt.getBytes("UTF-8");
		        MessageDigest md = MessageDigest.getInstance("SHA-1");
		        res = Base64.encodeBase64URLSafeString(md.digest(dataBytes));
		        
		    } catch (NoSuchAlgorithmException e) {
		        e.printStackTrace();
		    } catch (UnsupportedEncodingException e) {
		        e.printStackTrace();
		    }
		    return res;
	}
	public static void main(String[] args) {
		System.out.println(toSHA1("zxc123").equals("DPy6quIY7aFbbKsK9kyPKBZwUEU"));
	}
}
