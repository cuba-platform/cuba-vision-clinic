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

package com.company.cubavisionclinic.web.invoices;

import com.company.cubavisionclinic.entity.Invoices;
import com.haulmont.cuba.core.entity.Entity;
import com.haulmont.cuba.gui.ComponentsHelper;
import com.haulmont.cuba.gui.components.*;
import com.haulmont.cuba.gui.components.actions.CreateAction;
import com.haulmont.cuba.gui.components.actions.EditAction;
import com.haulmont.cuba.gui.components.actions.RemoveAction;
import com.haulmont.cuba.gui.data.CollectionDatasource;
import com.haulmont.cuba.gui.data.DataSupplier;
import com.haulmont.cuba.gui.data.Datasource;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.Collections;
import java.util.Map;
import java.util.UUID;
import com.haulmont.cuba.core.entity.IdProxy;

public class InvoicesBrowse extends AbstractLookup {

    @Inject
    private CollectionDatasource<Invoices, IdProxy<Long>> invoicesDs;

    @Inject
    private Datasource<Invoices> invoiceDs;

    @Inject
    private Table<Invoices> invoicesTable;

    @Inject
    private BoxLayout lookupBox;

    @Inject
    private BoxLayout actionsPane;

    @Inject
    private FieldGroup fieldGroup;

    @Inject
    private TabSheet tabSheet;
    
    @Named("invoicesTable.remove")
    private RemoveAction invoicesTableRemove;
    
    @Inject
    private DataSupplier dataSupplier;

    private boolean creating;

    @Override
    public void init(Map<String, Object> params) {
        invoicesDs.addItemChangeListener(e -> {
            if (e.getItem() != null) {
                Invoices reloadedItem = dataSupplier.reload(e.getDs().getItem(), invoiceDs.getView());
                invoiceDs.setItem(reloadedItem);
            }
        });
        
        invoicesTable.addAction(new CreateAction(invoicesTable) {
            @Override
            protected void internalOpenEditor(CollectionDatasource datasource, Entity newItem, Datasource parentDs, Map<String, Object> params) {
                invoicesTable.setSelected(Collections.emptyList());
                invoiceDs.setItem((Invoices) newItem);
                enableEditControls(true);
            }
        });

        invoicesTable.addAction(new EditAction(invoicesTable) {
            @Override
            protected void internalOpenEditor(CollectionDatasource datasource, Entity existingItem, Datasource parentDs, Map<String, Object> params) {
                if (invoicesTable.getSelected().size() == 1) {
                    enableEditControls(false);
                }
            }
        });

        /**
         * Handles the {@link Invoices} instance removal from the table. If the selected item is removed, removes the
         * selection from the table
         */
        invoicesTableRemove.setAfterRemoveHandler(removedItems -> invoiceDs.setItem(null));
        
        disableEditControls();
    }

    public void save() {
        getDsContext().commit();

        Invoices editedItem = invoiceDs.getItem();
        if (creating) {
            invoicesDs.includeItem(editedItem);
        } else {
            invoicesDs.updateItem(editedItem);
        }
        invoicesTable.setSelected(editedItem);

        disableEditControls();
    }

    public void cancel() {
        Invoices selectedItem = invoicesDs.getItem();
        if (selectedItem != null) {
            Invoices reloadedItem = dataSupplier.reload(selectedItem, invoiceDs.getView());
            invoicesDs.setItem(reloadedItem);
        } else {
            invoiceDs.setItem(null);
        }

        disableEditControls();
    }

    private void enableEditControls(boolean creating) {
        this.creating = creating;
        initEditComponents(true);
        fieldGroup.requestFocus();
    }

    private void disableEditControls() {
        initEditComponents(false);
        invoicesTable.requestFocus();
    }

    private void initEditComponents(boolean enabled) {
        ComponentsHelper.walkComponents(tabSheet, (component, name) -> {
            if (component instanceof FieldGroup) {
                ((FieldGroup) component).setEditable(enabled);
            } else if (component instanceof Table) {
                ((Table) component).getActions().stream().forEach(action -> action.setEnabled(enabled));
            }
        });
        actionsPane.setVisible(enabled);
        lookupBox.setEnabled(!enabled);
    }
}