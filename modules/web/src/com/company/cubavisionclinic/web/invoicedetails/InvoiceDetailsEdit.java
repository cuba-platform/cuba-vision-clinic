/*
 * Copyright (c) 2008-2016 Haulmont.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.company.cubavisionclinic.web.invoicedetails;

import com.company.cubavisionclinic.entity.InvoiceDetails;
import com.company.cubavisionclinic.entity.Product;
import com.haulmont.cuba.gui.components.AbstractEditor;
import com.haulmont.cuba.gui.components.PickerField;
import com.haulmont.cuba.gui.data.DataSupplier;

import javax.inject.Inject;
import javax.inject.Named;

public class InvoiceDetailsEdit extends AbstractEditor<InvoiceDetails> {

    @Named("fieldGroup.productProductid")
    private PickerField productProductidField;

    @Override
    protected void postInit() {
        super.postInit();

        /**
         *  Adding {@link com.haulmont.cuba.gui.components.Component.ValueChangeListener} for {@link productProductidField}
         *  to set initial value of the {@link InvoiceDetails#unitPrice} field in correspondence to {@link Product#getCurrentPrice()}
         */
        productProductidField.addValueChangeListener(e -> {
            Product selectedProduct = getItem().getProductProductid();
            if (selectedProduct != null) {
                getItem().setUnitPrice(selectedProduct.getCurrentPrice());
            } else
                getItem().setUnitPrice(null);
        });
    }
}