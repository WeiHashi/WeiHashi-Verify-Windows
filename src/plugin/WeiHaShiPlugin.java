package plugin;

import org.json.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.X509TrustManager;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.io.FileWriter;
import java.io.IOException;
import java.net.*;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Arrays;

public class WeiHaShiPlugin extends JFrame {

    private static JLabel label = new JLabel("<html>请确保设备已正常联网...<br>正在获取设备信息...");

    public WeiHaShiPlugin(String[] args) {
        Toolkit toolkit = Toolkit.getDefaultToolkit();
        Dimension screenSize = toolkit.getScreenSize();
        setTitle("微哈师授权工具");
        URL iconUrl = WeiHaShiPlugin.this.getClass().getResource("/img/whs.png");
        if (iconUrl != null) {
            setIconImage(new ImageIcon(iconUrl).getImage());
        }
        JPanel p = new JPanel();
        label.setFont(new Font("", Font.PLAIN, 20));
        label.setBorder(new EmptyBorder(20, 0, 0, 0));
        p.add(label);
        add(p);
        setBounds((screenSize.width - 600) / 2, (screenSize.height - 300) / 2, 600, 300);
        setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
        if (args.length == 0) {
            append(label, "<br>非法操作");
            delayFinish();
            return;
        }
        String noScheme = args[0].replace("meteor://", "");
        if (!noScheme.contains("/?")) {
            append(label, "<br>非法操作");
            delayFinish();
            return;
        }
        String[] parts = noScheme.split("/\\?");
        String host = parts[0];
        String params = parts[1];
        if (!host.equals("verify") || !params.contains("=")) {
            append(label, "<br>非法操作");
            delayFinish();
            return;
        }
        String[] param = params.split("=");
        String paramName = param[0];
        String deviceId = param[1];
        if (!paramName.equals("deviceId") || deviceId.replace(" ", "").isEmpty()) {
            append(label, "<br>非法操作");
            delayFinish();
            return;
        }
        try {
            InetAddress ia = InetAddress.getLocalHost();
            String hostName = ia.getHostName();
//            String mac = getLocalMac(ia);
//            System.out.println(mac);
            append(label, "<br>获取设备信息成功<br>正在验证授权...");
            Connection verify = getConnection();
            verify.data("hostName", hostName);
            verify.data("deviceId", deviceId);
            verify.ignoreHttpErrors(true);
            Connection.Response verifyRes = verify.method(Connection.Method.GET).execute();
            JSONObject verifyObj = new JSONObject(verifyRes.body());
            append(label, "<br>" + verifyObj.getString("msg"));
            delayFinish();
        } catch (UnknownHostException | SocketException e) {
            e.printStackTrace();
            append(label, "<br>获取设备信息失败，请重试");
            delayFinish();
        } catch (IOException e) {
            e.printStackTrace();
            append(label, "<br>请求服务器失败，请检查网络连接");
            delayFinish();
        }
    }

    public static void main(String[] args) {
        new WeiHaShiPlugin(args);
    }

    private static void append(JLabel label, String s) {
        label.setText(label.getText() + s);
    }

//    private static String getLocalMac(InetAddress ia) throws SocketException {
//        byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();
//        StringBuilder sb = new StringBuilder("");
//        for (int i = 0; i < mac.length; i++) {
//            if (i != 0) {
//                sb.append("-");
//            }
//            //字节转换为整数
//            int temp = mac[i] & 0xff;
//            String str = Integer.toHexString(temp);
//            if (str.length() == 1) {
//                sb.append("0").append(str);
//            } else {
//                sb.append(str);
//            }
//        }
//        return sb.toString().toUpperCase();
//    }

    private static void delayFinish() {
        append(label, "<br>5秒后自动关闭");
        new Thread(() -> {
            try {
                Thread.sleep(5000);
                System.exit(0);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();
    }

    private static Connection getConnection() {
        Connection connection = Jsoup.connect("https://devmeteor.cn:8080/v2/device/verify");
        connection.ignoreContentType(true);
        connection.timeout(60000);
        return connection;
    }

}
