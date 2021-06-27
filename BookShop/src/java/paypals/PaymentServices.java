/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paypals;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author haudq
 */
public class PaymentServices implements Serializable {

    private static final String CLIENT_ID = "AfEW8FqLC4cB-JnuZHNSkx4dHySpBY1hLEANFi-0k4kAH0Z2ZoJafZT-LmHwVDwpHyNZUv4ydE2iAngu";
    private static final String CLIENT_SECRET = "EHzFBxaBtl1IJnbyuhtUW9w3lP14o7E2DKLkwhDZE7oClieb13AbaTHEuKYUm-ets_TNoLNmpOEG7DH_";
    private static final String MODE = "sandbox";

    public String authorizePayment(OrderDetailPaypal orderDetail)
            throws PayPalRESTException {
        try {
            Payer payer = getPayerInformation();
            RedirectUrls redirectUrls = getRedirectURLs();
            List<Transaction> listTransaction = getTransactionInformation(orderDetail);

            Payment requestPayment = new Payment();
            requestPayment.setTransactions(listTransaction);
            requestPayment.setRedirectUrls(redirectUrls);
            requestPayment.setPayer(payer);
            requestPayment.setIntent("authorize");

            APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

            Payment approvedPayment = requestPayment.create(apiContext);
                    return getApprovalLink(approvedPayment);

        } catch (Exception e) {
            int temp = 1;
        }
        return null;

    }

    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("John")
                .setLastName("Doe")
                .setEmail("sb-08rvu6632569@personal.example.com");

        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/BookShop/user/payment/cancel.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/BookShop/ReviewPaypalUserController");

        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(OrderDetailPaypal orderDetail) {
        Details details = new Details();
        details.setShipping(orderDetail.getShipping());
        details.setSubtotal(orderDetail.getSubtotal());
        details.setTax(orderDetail.getTax());

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetail.getTotal());
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetail.getProductName());

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        Item item = new Item();
        item.setCurrency("USD");
        item.setName(orderDetail.getProductName());
        item.setPrice(orderDetail.getSubtotal());
        item.setTax(orderDetail.getTax());
        item.setQuantity("1");

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }

        return approvalLink;
    }
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
    return Payment.get(apiContext, paymentId);
}
}
