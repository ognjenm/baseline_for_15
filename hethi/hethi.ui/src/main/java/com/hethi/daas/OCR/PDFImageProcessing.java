package com.hethi.daas.OCR;

import java.awt.HeadlessException;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.util.PDFImageWriter;

import com.hethi.daas.ImageIO.ImageProcessesingServices;
import com.hethi.rest.utility.PDFUtility;

import net.sourceforge.tess4j.TesseractException;
import net.sourceforge.tess4j.util.PdfUtilities;

public class PDFImageProcessing {
	
	
	
	public static File convertScannedPDFToTiff(String sc_PDF) throws IOException, TesseractException {
			File tiff_File = PdfUtilities.convertPdf2Tiff(new File(sc_PDF));
			writeImage(tiff_File);
			return tiff_File;
	}

			public static void writeImage(File inputFile){
				try {
				    // retrieve image
				    BufferedImage bi = ImageIO.read(inputFile);
				    File outputfile = new File("saved.tif");
				    ImageIO.write(bi, "tif", outputfile);
				    
				} catch (IOException e) {
				
			}
				System.out.println("Image written successfully ...");
			}
			
			
			
			public void ConvertPdfToImage(String sPdfPath) throws IOException {
				// converted images from pdf document are saved here

				File sourceFile = new File(sPdfPath);
				File destinationFile = new File(sPdfPath.replace(".pdf", ".jpg"));

				if (sourceFile.exists()) {
					System.out.println("Images copied to Folder: " + destinationFile.getName());
					PDDocument document = PDDocument.load(sourceFile);
					List<PDPage> list = document.getDocumentCatalog().getAllPages();
					System.out.println("Total files to be converted -> " + list.size());

					String fileName = sourceFile.getName().replace(".pdf", "");
					int pageNumber = 1;
					for (PDPage page : list) {
						BufferedImage image = page.convertToImage();

						File outputfile = new File(sPdfPath.replace(".pdf", ".jpg"));
						System.out.println("Image Created -> " + outputfile.getName());
						ImageIO.write(image, "jpeg", outputfile);

						pageNumber++;
						break;
					}
					document.close();
					System.out.println("Converted Images are saved at -> " + destinationFile.getAbsolutePath());
				} else {
					System.err.println(sourceFile.getName() + " File not exists");
				}

			}
			
			
			
			
			
			public void convertPdfToImage( String password, String inputFile, String outputPath, String imageFormat, int startPage, int endPage, String color) throws Exception
		    {
		       
		        int resolution;
		        try
		        {
		            //resolution = Toolkit.getDefaultToolkit().getScreenResolution();
		            resolution=120;
		            System.out.println("the resolution is == >"+resolution);
		        }
		        catch( HeadlessException e )
		        {
		            resolution = 96;
		        }
		        
		        if( inputFile == null )
		        {
		        	System.out.println("Invalid PDF Source...");
		            return;
		        }
		        else
		        {
		            if(outputPath == null)
		            {
		                outputPath = inputFile.substring( 0, inputFile.lastIndexOf( '.' ));
		            }

		            PDDocument document = null;
		            try
		            {
		                document = PDDocument.load( inputFile );     
		                //document.print();

		                if( document.isEncrypted() )
		                {
		                    try
		                    {
		                        document.decrypt( password );
		                    }
		                    catch( Exception e )
		                    {
		                       
		                            //they didn't supply a password and the default of "" was wrong.
		                            System.err.println( "Error: The document is encrypted." );
		                            return;
		                        
		                    }
		                }
		                int imageType = 24;
		                if ("bilevel".equalsIgnoreCase(color))
		                {
		                    imageType = BufferedImage.TYPE_BYTE_BINARY;
		                }
		                else if ("indexed".equalsIgnoreCase(color))
		                {
		                    imageType = BufferedImage.TYPE_BYTE_INDEXED;
		                }
		                else if ("gray".equalsIgnoreCase(color))
		                {
		                    imageType = BufferedImage.TYPE_BYTE_GRAY;
		                }
		                else if ("rgb".equalsIgnoreCase(color))
		                {
		                    imageType = BufferedImage.TYPE_INT_RGB;
		                }
		                else if ("rgba".equalsIgnoreCase(color))
		                {
		                    imageType = BufferedImage.TYPE_INT_ARGB;
		                }
		                else
		                {
		                    System.err.println( "Error: the number of bits per pixel must be 1, 8 or 24." );
		                    System.exit( 2 );
		                }

		                //Make the call
		                PDFImageWriter imageWriter = new PDFImageWriter();
		                boolean success = imageWriter.writeImage(document, imageFormat, password,
		                        startPage, endPage, outputPath, imageType, 72);
		               
		                /**
		                 * Identify The Pdf is Scanned one or not
		                 * 
		                 */
		                
		                
		                PDFUtility utility=new PDFUtility();
						boolean isScanned=utility.isScannedPDF(inputFile);
							if(isScanned){
								System.out.println("in pdf to image ");
				                for(int i=1;i<=endPage-startPage+1;i++){
				                	
				                ImageProcessesingServices.getFullOCR(outputPath+i+"."+imageFormat);
				                }
							}
		               /* File image=new File(outputPath+"1."+imageFormat);
		                image.renameTo(new File(outputPath+"."+imageFormat));*/
		                if (!success)
		                {
		                    System.err.println( "Error: no writer found for image format '"
		                            + imageFormat + "'" );
		                    System.exit(1);
		                }
		                else
		                {
		                	//File f  = new File(pdfInputFile.replace(".pdf",+startPage+ ".jpg"));
		                	File f  = new File(inputFile.replace(".pdf", "."+imageFormat));
		                	//File fdest  = new File(pdfInputFile.replace(".pdf",  ".jpg"));
		                	/*if (f.exists())
		                	{
		                		f.renameTo(fdest);
		                		if (fdest.exists())
		                		{
		                			System.out.println("The image file successfully moved to " + pdfInputFile.replace(".pdf",  ".jpg"));
		                		}
		                	}*/
		                }
		                
		            }
		            catch (Exception e)
		            {
		                System.err.println(e);
		            }
		            finally
		            {
		                if( document != null )
		                {
		                    document.close();
		                }
		            }
		        }
		        System.out.println("the ");
		    }
			
			
			/*
			public static void main(String args[]) throws Exception{
				PDFImageProcessing pdfImg=new PDFImageProcessing();
				pdfImg.convertPdfToImage("","grayscale1456313263510.pdf", null,"jpg", 1, 1, "rgb");
			}*/
			
}
