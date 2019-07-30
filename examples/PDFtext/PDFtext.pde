/*
  Simple exemple to read pdf text
*/

import java.io.File;
import java.io.IOException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

void setup() {   
  size(240, 240);     
  readPFD("PDFtext.pdf");
}

void loop()
{
}

void readPFD(String file_Name)
{
  PDDocument document = null;   
  try  
  {      
    //Loading an existing document
    String path = sketchPath();
    String text = "";
    
    File file = new File(path + "\\" + file_Name);
    document = PDDocument.load(file);    
    //Instantiate PDFTextStripper class
    PDFTextStripper pdfStripper = new PDFTextStripper() ;
    //Retrieving text from PDF document
    text = pdfStripper.getText(document) ;     
    
    println("--------------------");
    println(file_Name);
    println("--------------------");
    println(text);
    println("--------------------");
  }
  catch (Exception e)
  {
    e.printStackTrace();
  }
  finally
  {
    if (document != null)
    {   
      try { 
      document.close(); 
    }
      catch (IOException e)  
      {   
       println("Problem when closing doc: " + e.getMessage()); 
      }
    }     
  }    
}
