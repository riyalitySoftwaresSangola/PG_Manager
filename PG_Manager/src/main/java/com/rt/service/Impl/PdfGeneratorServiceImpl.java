package com.rt.service.Impl;

import com.rt.entity.Bill;
import com.rt.service.PdfGeneratorService;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

@Service
public class PdfGeneratorServiceImpl implements PdfGeneratorService {

	
//	  @Autowired
//	    private TemplateEngine templateEngine;
	  
	  
    @Override
    public byte[] generateBillPdf(List<Bill> bills) throws Exception {
        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, out);

        document.open();

        // Title
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        Paragraph title = new Paragraph("Bill Report", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);
        document.add(Chunk.NEWLINE);

        // Table setup
        PdfPTable table = new PdfPTable(10);
        table.setWidthPercentage(100);
        table.setWidths(new float[]{1, 2, 2, 2, 2, 2, 2, 2, 2, 3});

        String[] headers = {
                "#", "Tenant ID", "Month", "Rent", "Meal", "Electricity",
                "Other", "Total", "Status", "Generated"
        };

        for (String header : headers) {
            PdfPCell cell = new PdfPCell(new Phrase(header));
            cell.setBackgroundColor(Color.LIGHT_GRAY);
            cell.setPadding(5);
            table.addCell(cell);
        }

        int count = 1;
        for (Bill bill : bills) {
            table.addCell(String.valueOf(count++));
            table.addCell(String.valueOf(bill.getCustomerId()));
            table.addCell(bill.getBillingMonth());
            table.addCell(String.valueOf(bill.getRent()));
            table.addCell(String.valueOf(bill.getMealCharges()));
            table.addCell(String.valueOf(bill.getElectricityCharges()));
            table.addCell(String.valueOf(bill.getOtherCharges()));
            table.addCell(String.valueOf(bill.getTotalAmount()));
            table.addCell(bill.getStatus());
            table.addCell(bill.getGeneratedDate().toString());
        }

        document.add(table);
        document.close();

        return out.toByteArray();
    }


	@Override
	public byte[] generateBillPdfFromTemplate(Bill bill) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}
    
    
  

//    public byte[] generateBillPdfFromTemplate(Bill bill) throws IOException {
//        Context context = new Context();
//        context.setVariable("bill", bill);
//
//        String html = templateEngine.process("template", context); // refers to `resources/templates/template.html`
//
//        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//        PdfRendererBuilder builder = new PdfRendererBuilder();
//        builder.useFastMode();
//        builder.withHtmlContent(html, "/");
//        builder.toStream(outputStream);
//        builder.run();
//
//        return outputStream.toByteArray();
//    }

    
    
}
