package com.google.anatofuz;

import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class LogAnalyzer {

    public static void main(String args[]) {

        File file = new File("/var/log/system.log");

        if (args.length != 0) {
            if (args[0].equals("-f")) {
                file = new File(args[1]);
            }
        }

        try {
            FileReader filereader = new FileReader(file);
            BufferedReader bufferedReader = new BufferedReader(filereader);

            String line;
            Map<String,Integer>  map = new HashMap<String,Integer>(0);
            Pattern p = Pattern.compile("\\w+ \\d{0,2} (?:\\d{2}:?){3} (?:anatofuzMBP|anatofuz-15) ([\\w.]+)\\[\\d+\\]");


            while ((line = bufferedReader.readLine()) != null) {
                Matcher matcher = p.matcher(line);
                if (matcher.find()) {
                    map.merge(matcher.group(1),1,Integer::sum);
                }
            }

            int sum = 0;

            for (String key :map.keySet()){
                sum += map.get(key);
            }

            System.out.println(sum);


        } catch (FileNotFoundException ex){
            System.out.println(ex);
        } catch (IOException ex){
            System.out.println(ex);
        }
    }
}
