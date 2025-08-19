package com.rt.controller;

import com.rt.entity.Bill;
import com.rt.service.BillService;
import com.rt.service.PdfGeneratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/bills")
public class BillPdfController {

    @Autowired
    private BillService billService;

    @Autowired
    private PdfGeneratorService pdfGeneratorService;

    // ✅ 1. View all bills as PDF in browser
    @GetMapping("/view-pdf")
    public ResponseEntity<byte[]> viewAllBillsPdf() {
        return generatePdfResponse(billService.getAllBills(), false, "bills-report.pdf");
    }

    // ✅ 2. Download all bills as PDF
    @GetMapping("/download-pdf")
    public ResponseEntity<byte[]> downloadAllBillsPdf() {
        return generatePdfResponse(billService.getAllBills(), true, "bills-report.pdf");
    }

    // ✅ 3. View single bill by Bill ID
//    @GetMapping("/view-pdf/bill/{billId}")
//    public ResponseEntity<byte[]> viewPdfByBillId(@PathVariable Long billId) {
//        Bill bill = billService.getBillById(billId);
//        if (bill == null) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
//        }
//        return generatePdfResponse(List.of(bill), false, "bill-" + billId + ".pdf");
//    }

    // ✅ 4. Download single bill by Bill ID
//    @GetMapping("/download-pdf/bill/{billId}")
//    public ResponseEntity<byte[]> downloadPdfByBillId(@PathVariable Long billId) {
//        Bill bill = billService.getBillById(billId);
//        if (bill == null) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
//        }
//        return generatePdfResponse(List.of(bill), true, "bill-" + billId + ".pdf");
//    }

    // ✅ 5. View bills by Tenant ID
  //  @GetMapping("/view-pdf/tenant/{tenantId}")
//    public ResponseEntity<byte[]> viewPdfByTenantId(@PathVariable Long tenantId) {
//        List<Bill> bills = billService.getBillsByCustomerId(tenantId);
//        if (bills == null || bills.isEmpty()) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
//        }
//        return generatePdfResponse(bills, false, "tenant-" + tenantId + "-bills.pdf");
//    }

    // ✅ 6. Download bills by Tenant ID
//    @GetMapping("/download-pdf/tenant/{tenantId}")
//    public ResponseEntity<byte[]> downloadPdfByTenantId(@PathVariable Long tenantId) {
//        List<Bill> bills = billService.getBillsByCustomerId(tenantId);
//        if (bills == null || bills.isEmpty()) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
//        }
//        return generatePdfResponse(bills, true, "tenant-" + tenantId + "-bills.pdf");
//    }

    // 🔧 Helper method to build PDF Response
    private ResponseEntity<byte[]> generatePdfResponse(List<Bill> bills, boolean download, String filename) {
        try {
            byte[] pdfBytes = pdfGeneratorService.generateBillPdf(bills);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);

            if (download) {
                headers.setContentDisposition(ContentDisposition.attachment().filename(filename).build());
            }

            return ResponseEntity.ok().headers(headers).body(pdfBytes);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    
    
    
//    @GetMapping("/bills/download-pdf/{tenantId}")
//    public ResponseEntity<byte[]> downloadBillForTenant(@PathVariable Long tenantId) {
//        try {
//            Bill bill = billService.getLatestBillByTenantId(tenantId); // or use getBillById if it's single
//            if (bill == null) {
//                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
//            }
//
//            byte[] pdfBytes = pdfGeneratorService.generateBillPdfFromTemplate(bill);
//
//            HttpHeaders headers = new HttpHeaders();
//            headers.setContentType(MediaType.APPLICATION_PDF);
//            headers.setContentDisposition(
//                ContentDisposition.attachment().filename("bill-tenant-" + tenantId + ".pdf").build()
//            );
//
//            return ResponseEntity.ok().headers(headers).body(pdfBytes);
//
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
//        }
//    }

}
