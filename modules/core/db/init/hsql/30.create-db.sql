insert into Product
(ProductID, ProductName, MSRP, Description, ProductImage, Category)
values (1, 'Eye Drops', 14.9900, 'Provides redness relief from pollen, ragweed, and dust allergies.', null, 'Allergy');
insert into ProductRebate
(ProductRebateID, ProductID, RebateStart, RebateEnd, Rebate)
values (1, 1, '2016-08-16 00:00:00', '2017-02-01 00:00:00', 5.0000);
insert into ProductRebate
(ProductRebateID, ProductID, RebateStart, RebateEnd, Rebate)
values (3, 1, '2016-10-10 00:00:00', '2017-11-11 00:00:00', 5.0000);
insert into ProductRebate
(ProductRebateID, ProductID, RebateStart, RebateEnd, Rebate)
values (4, 1, '2016-08-20 00:00:00', '2017-09-21 00:00:00', 2.5000);

insert into Product
(ProductID, ProductName, MSRP, Description, ProductImage, Category)
values (2, 'Lens Cleaner', 24.5000, 'Keeps contact lenses spot free.', null, 'Lens Care');
insert into ProductRebate
(ProductRebateID, ProductID, RebateStart, RebateEnd, Rebate)
values (2, 2, '2010-09-01 22:00:00', '2010-12-31 00:00:00', 5.0000);
insert into ProductRebate
(ProductRebateID, ProductID, RebateStart, RebateEnd, Rebate)
values (5, 2, '2010-10-01 00:00:00', '2010-12-31 00:00:00', 6.0000);

insert into Product
(ProductID, ProductName, MSRP, Description, ProductImage, Category)
values (3, 'Eye Wash', 12.8900, 'Soothes and comforts irritated, dry eyes.', null, 'Dry Eyes');
insert into ProductRebate
(ProductRebateID, ProductID, RebateStart, RebateEnd, Rebate)
values (6, 3, '2010-08-30 00:00:00', '2010-09-07 00:00:00', 2.0000);

insert into Product
(ProductID, ProductName, MSRP, Description, ProductImage, Category)
values (4, 'Advanced Lens Cleaner', 21.6600, 'Advanced care for your contact lenses.', null, 'Lens Care');

insert into Product
(ProductID, ProductName, MSRP, Description, ProductImage, Category)
values (5, 'Itch Reliever', 9.7500, 'An antihistamine for itch relief with a redness reliever.', null, 'Allergy');

insert into Product
(ProductID, ProductName, MSRP, Description, ProductImage, Category)
values (6, 'Lens Moisturizer', 15.9800, 'Specially formulated to revitalize your contact lenses. ', null, 'Dry Eyes');

insert into Product
(ProductID, ProductName, MSRP, Description, ProductImage, Category)
values (7, 'Moisture Drops', 14.9900, 'Designed to be as gentle as your natural tears.', null, 'Dry Eyes');

insert into Patients
(ID, Name, Street, Street2, City, State, Zip, PrimaryPhone, SecondaryPhone, Email, PolicyNumber, Created, CreatedBy, Modified, ModifiedBy)
values (1, 'Martin Beards', '46 Lestrand Str.', null, 'Danver', 'OR', '46468', '(503) 216-4156', null, null, 'SN4634742', '2016-11-01 09:04:25', 'TestUser', '2016-11-01 09:04:25', 'TestUser');

insert into Patients
(ID, Name, Street, Street2, City, State, Zip, PrimaryPhone, SecondaryPhone, Email, PolicyNumber, Created, CreatedBy, Modified, ModifiedBy)
values (2, 'Howard Snyder', '2732 Baker Blvd.', null, 'Eugene', 'OR', '97430', '(503) 555-7555', null, null, 'SN3265945', '2016-11-01 09:04:25', 'TestUser', '2016-11-01 09:04:25', 'TestUser');

insert into Patients
(ID, Name, Street, Street2, City, State, Zip, PrimaryPhone, SecondaryPhone, Email, PolicyNumber, Created, CreatedBy, Modified, ModifiedBy)
values (3, 'John Doe', '45 Broadway Blvd.', null, 'Chicago', 'AR', '43413', '(503) 565-5698', null, null, 'SN123654', null, null, null, null);

insert into Patients
(ID, Name, Street, Street2, City, State, Zip, PrimaryPhone, SecondaryPhone, Email, PolicyNumber, Created, CreatedBy, Modified, ModifiedBy)
values (4, 'Jane Doe', '789 Olster Str.', null, 'Danver', 'OR', '56893', '(504)654-8931', null, null, 'SN321456', null, null, null, null);

insert into Appointments
(ID, AppointmentTime, AppointmentDate, AppointmentType, DoctorNotes, Appointment_Patient, Created, CreatedBy, Modified, ModifiedBy)
values (1, '13:04:41', '2016-11-01', 0, null, 1, '2016-11-01 09:04:51', 'TestUser', '2016-11-01 09:04:51', 'TestUser');

insert into Appointments
(ID, AppointmentTime, AppointmentDate, AppointmentType, DoctorNotes, Appointment_Patient, Created, CreatedBy, Modified, ModifiedBy)
values (2, '13:04:54', '2016-11-02', 0, null, 2, '2016-11-01 09:05:04', 'TestUser', '2016-11-01 09:05:04', 'TestUser');

insert into Appointments
(ID, AppointmentTime, AppointmentDate, AppointmentType, DoctorNotes, Appointment_Patient, Created, CreatedBy, Modified, ModifiedBy)
values (3, '13:46:17', '2016-12-06', 1, null, 2, '2016-11-01 09:46:28', 'TestUser', '2016-11-01 09:46:28', 'TestUser');

insert into Appointments
(ID, AppointmentTime, AppointmentDate, AppointmentType, DoctorNotes, Appointment_Patient, Created, CreatedBy, Modified, ModifiedBy)
values (4, '18:32:55', '2016-11-01', 0, null, 3, null, null, null, null);

insert into Appointments
(ID, AppointmentTime, AppointmentDate, AppointmentType, DoctorNotes, Appointment_Patient, Created, CreatedBy, Modified, ModifiedBy)
values (5, '18:33:18', '2016-11-01', 0, null, 2, null, null, null, null);

insert into Invoices
(ID, InvoiceDate, InvoiceDue, InvoiceStatus, ShipDate, Invoice_Patient, Created, CreatedBy, Modified, ModifiedBy)
values (1, '2016-11-02 13:47:53', '2016-12-02 13:47:53', 0, '2016-11-03 13:47:53', 2, '2016-11-01 09:48:28', 'TestUser', '2016-11-01 09:54:15', 'TestUser');
insert into InvoiceDetails
(ID, Quantity, UnitPrice, Product_ProductID, Invoice_InvoiceDetail, Created, CreatedBy, Modified, ModifiedBy)
values (2, 2, 24.50, 2, 1, '2017-08-22 11:18:48', 'admin', '2017-08-22 11:18:48', null);

insert into Invoices
(ID, InvoiceDate, InvoiceDue, InvoiceStatus, ShipDate, Invoice_Patient, Created, CreatedBy, Modified, ModifiedBy)
values (2, '2016-11-02 17:30:00', '2016-12-03 17:30:00', 0, '2016-11-05 00:00:00', 2, null, null, null, null);
insert into InvoiceDetails
(ID, Quantity, UnitPrice, Product_ProductID, Invoice_InvoiceDetail, Created, CreatedBy, Modified, ModifiedBy)
values (1, 2, 12.89, 3, 2, null, null, null, null);

