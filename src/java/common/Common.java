package common;

import java.io.PrintWriter;
import mysql.MysqlConnection;

public class Common {
    public static final MysqlConnection connection=new MysqlConnection();
    
    
    public static void mesajGoster(PrintWriter writer,String mesaj,boolean basarili){
        writer.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
        writer.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        writer.println("<script>");
        writer.println("$(document).ready(function(){");
        writer.println("swal('','"+mesaj+"','"+(basarili?"success":"error")+"')");
        writer.println("});");
        writer.println("</script>");
    }
}
