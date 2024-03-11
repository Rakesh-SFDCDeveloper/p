public class PasswordGen {
    public static String getPassword(Integer len) {
        Blob blobKey = crypto.generateAesKey(128);
        String key = EncodingUtil.convertToHex(blobKey);
        
        System.debug(key);
           System.debug(len);
        
        return key.substring(0,len);
    }
}