<?php

//TESTING [DEV]
Route::get("test", "Test@index");
Route::post("test", "Test@index");

//HOME PAGE
Route::any('/', function () {
    return redirect('/home');
});
Route::any('home', 'Home@index')->name('home');

//LOGIN & SIGNUP
Route::get("/login", "Authenticate@logIn")->name('login');
Route::post("/login", "Authenticate@logInAction")->name('login.action');
Route::get("/forgotpassword", "Authenticate@forgotPassword")->name('forgotpassword');
Route::post("/forgotpassword", "Authenticate@forgotPasswordAction")->name('forgotpassword.action');
Route::get("/signup", "Authenticate@signUp")->name('signup');
Route::post("/signup", "Authenticate@signUpAction")->name('signup.action');
Route::get("/resetpassword", "Authenticate@resetPassword")->name('resetpassword');
Route::post("/resetpassword", "Authenticate@resetPasswordAction")->name('resetpassword.action');
Route::get("/access", "Authenticate@directLoginAccess")->name('directlogin.access');


//LOGOUT
Route::any('logout', function () {
    Auth::logout();
    return redirect('/login');
});

//CLIENTS
Route::group(['prefix' => 'clients'], function () {
    Route::any("/search", "Clients@index")->name('client.search');
    Route::post("/delete", "Clients@destroy")->middleware(['demoModeCheck'])->name('client.delete');
    Route::get("/change-category", "Clients@changeCategory")->name('client.change-category');
    Route::post("/change-category", "Clients@changeCategoryUpdate")->name('client.change-category.update');
    Route::get("/{client}/client-details", "Clients@details")->where('client', '[0-9]+')->name('client.details');
    Route::post("/{client}/client-details", "Clients@updateDescription")->where('client', '[0-9]+')->name('client.details.update');
    Route::get("/logo", "Clients@logo")->name('client.logo');
    Route::put("/logo", "Clients@updateLogo")->middleware(['demoModeCheck'])->name('client.logo.update');
    Route::get("/{client}/billing-details", "Clients@editBillingDetails")->where('client', '[0-9]+')->name('client.billing-details.edit');
    Route::put("/{client}/billing-details", "Clients@updateBillingDetails")->where('client', '[0-9]+')->name('client.billing-details.update');
    //dynamic load
    Route::any("/{client}/{section}", "Clients@showDynamic")
        ->where(['client' => '[0-9]+', 'section' => 'details|contacts|projects|files|tickets|invoices|expenses|payments|timesheets|estimates|notes'])
        ->name('client.dynamic');
});
Route::any("/client/{x}/profile", "Clients@profile")->where('x', '[0-9]+')->name('client.profile');
Route::resource('clients', 'Clients');

//CONTACTS
Route::group(['prefix' => 'contacts'], function () {
    Route::any("/search", "Contacts@index")->name('contacts.search');
    Route::get("/updatepreferences", "Contacts@updatePreferences")->name('contacts.update-preferences');
    Route::post("/delete", "Contacts@destroy")->middleware(['demoModeCheck'])->name('contacts.delete');
    
});
Route::resource('contacts', 'Contacts');
Route::resource('users', 'Contacts');

//TEAM
Route::group(['prefix' => 'team'], function () {
    Route::any("/search", "Team@index")->name('team.search');
    Route::get("/updatepreferences", "Team@updatePreferences")->name('team.update-preferences');
});

Route::resource('team', 'Team');

//SETTINGS - USER
Route::group(['prefix' => 'user'], function () {
    Route::get("/avatar", "User@avatar")->name('user.avatar');
    Route::put("/avatar", "User@updateAvatar")->middleware(['demoModeCheck'])->name('user.avatar.update');
    Route::get("/notifications", "User@notifications")->name('user.notifications');
    Route::put("/notifications", "User@updateNotifications")->name('user.notifications.update');
    Route::get("/updatepassword", "User@updatePassword")->name('user.update-password');
    Route::put("/updatepassword", "User@updatePasswordAction")->middleware(['demoModeCheck'])->name('user.update-password.action');
    Route::get("/updatenotifications", "User@updateNotifications")->name('user.update-notifications');
    Route::put("/updatenotifications", "User@updateNotificationsAction")->middleware(['demoModeCheck'])->name('user.update-notifications.action');
    Route::post("/updatelanguage", "User@updateLanguage")->middleware(['demoModeCheck'])->name('user.update-language');
    Route::get("/updatetheme", "User@updateTheme")->name('user.update-theme');
    Route::put("/updatetheme", "User@updateThemeAction")->middleware(['demoModeCheck'])->name('user.update-theme.action');
});


//INVOICES
Route::group(['prefix' => 'invoices'], function () {
    Route::any("/search", "Invoices@index")->name('invoices.search');
    Route::post("/delete", "Invoices@destroy")->middleware(['demoModeCheck'])->name('invoices.delete');
    Route::get("/change-category", "Invoices@changeCategory")->name('invoices.change-category');
    Route::post("/change-category", "Invoices@changeCategoryUpdate")->name('invoices.change-category.update');
    Route::get("/add-payment", "Invoices@addPayment")->name('invoices.add-payment');
    Route::post("/add-payment", "Invoices@addPayment")->name('invoices.add-payment.store');
    Route::get("/{invoice}/clone", "Invoices@createClone")->where('invoice', '[0-9]+')->name('invoices.clone');
    Route::post("/{invoice}/clone", "Invoices@storeClone")->where('invoice', '[0-9]+')->name('invoices.clone.store');
    Route::get("/{invoice}/stop-recurring", "Invoices@stopRecurring")->where('invoice', '[0-9]+')->name('invoices.stop-recurring');
    Route::get("/{invoice}/attach-project", "Invoices@attachProject")->where('invoice', '[0-9]+')->name('invoices.attach-project');
    Route::post("/{invoice}/attach-project", "Invoices@attachProjectUpdate")->where('invoice', '[0-9]+')->name('invoices.attach-project.update');
    Route::get("/{invoice}/detach-project", "Invoices@dettachProject")->where('invoice', '[0-9]+')->name('invoices.detach-project');
    Route::get("/{invoice}/email-client", "Invoices@emailClient")->where('invoice', '[0-9]+')->name('invoices.email-client');
    Route::get("/{invoice}/download-pdf", "Invoices@downloadPDF")->where('invoice', '[0-9]+')->name('invoices.download-pdf');
    Route::get("/{invoice}/recurring-settings", "Invoices@recurringSettings")->where('invoice', '[0-9]+')->name('invoices.recurring-settings');
    Route::post("/{invoice}/recurring-settings", "Invoices@recurringSettingsUpdate")->where('invoice', '[0-9]+')->name('invoices.recurring-settings.update');
    Route::get("/{invoice}/edit-invoice", "Invoices@show")->where('invoice', '[0-9]+')->middleware(['invoicesMiddlewareEdit', 'invoicesMiddlewareShow'])->name('invoices.edit');
    Route::post("/{invoice}/edit-invoice", "Invoices@saveInvoice")->where('invoice', '[0-9]+')->name('invoices.edit.save');
    Route::get("/{invoice}/pdf", "Invoices@show")->where('invoice', '[0-9]+')->middleware(['invoicesMiddlewareShow'])->name('invoices.pdf');
    Route::get("/{invoice}/publish", "Invoices@publishInvoice")->where('invoice', '[0-9]+')->middleware(['invoicesMiddlewareEdit', 'invoicesMiddlewareShow'])->name('invoices.publish');
    Route::get("/{invoice}/resend", "Invoices@resendInvoice")->where('invoice', '[0-9]+')->middleware(['invoicesMiddlewareEdit', 'invoicesMiddlewareShow'])->name('invoices.resend');
    Route::get("/{invoice}/stripe-payment", "Invoices@paymentStripe")->where('invoice', '[0-9]+')->name('invoices.stripe-payment');
    Route::get("/{invoice}/paypal-payment", "Invoices@paymentPaypal")->where('invoice', '[0-9]+')->name('invoices.paypal-payment');
    Route::get("/timebilling/{project}/", "Timebilling@index")->where('project', '[0-9]+')->name('invoices.timebilling');
    Route::get("/{invoice}/razorpay-payment", "Invoices@paymentRazorpay")->where('invoice', '[0-9]+')->name('invoices.razorpay-payment');
    Route::get("/{invoice}/mollie-payment", "Invoices@paymentMollie")->where('invoice', '[0-9]+')->name('invoices.mollie-payment');
    Route::get("/{invoice}/tap-payment", "Invoices@paymentTap")->where('invoice', '[0-9]+')->name('invoices.tap-payment');
    Route::get("/{invoice}/paystack-payment", "Invoices@paymentPaystack")->where('invoice', '[0-9]+')->name('invoices.paystack-payment');
    Route::post("/{invoice}/attach-files", "Invoices@attachFiles")->where('estimate', '[0-9]+')->name('invoices.attach-files');
    Route::get("/delete-attachment", "Invoices@deleteFile")->name('invoices.delete-attachment');
    Route::post("/{invoice}/change-tax-type", "Invoices@updateTaxType")->where('invoice', '[0-9]+')->name('invoices.change-tax-type');

    //view from email link
    Route::get("/redirect/{invoice}", "Invoices@redirectURL")->where('invoice', '[0-9]+')->name('invoices.redirect');
});

Route::resource('invoices', 'Invoices');

//SUBSCRIPTIONS
Route::group(['prefix' => 'subscriptions'], function () {
    Route::any("/search", "Subscriptions@index")->name('subscriptions.search');
    Route::post("/delete", "Subscriptions@destroy")->middleware(['demoModeCheck'])->name('subscriptions.delete');
    Route::get("/change-category", "Subscriptions@changeCategory")->name('subscriptions.change-category');
    Route::post("/change-category", "Subscriptions@changeCategoryUpdate")->name('subscriptions.change-category.update');
    Route::get("/getprices", "Subscriptions@getProductPrices")->name('subscriptions.get-prices');
    Route::get("/{subscription}/invoices", "Subscriptions@subscriptionInvoices")->where('subscription', '[0-9]+')->name('subscriptions.invoices');
    Route::get("/{subscription}/pay", "Subscriptions@setupStripePayment")->where('subscription', '[0-9]+')->name('subscriptions.pay');
    Route::get("/{subscription}/cancel", "Subscriptions@cancelSubscription")->where('subscription', '[0-9]+')->middleware(['demoModeCheck'])->name('subscriptions.cancel');
});

Route::resource('subscriptions', 'Subscriptions');

//ESTIMATES
Route::group(['prefix' => 'estimates'], function () {
    Route::any("/search", "Estimates@index")->name('estimates.search');
    Route::post("/delete", "Estimates@destroy")->middleware(['demoModeCheck'])->name('estimates.delete');
    Route::get("/change-category", "Estimates@changeCategory")->name('estimates.change-category');
    Route::post("/change-category", "Estimates@changeCategoryUpdate")->name('estimates.change-category.update');
    Route::get("/{estimate}/attach-project", "Estimates@attachProject")->where('estimate', '[0-9]+')->name('estimates.attach-project');
    Route::post("/{estimate}/attach-project", "Estimates@attachProjectUpdate")->where('invoice', '[0-9]+')->name('estimates.attach-project.update');
    Route::get("/{estimate}/detach-project", "Estimates@dettachProject")->where('estimate', '[0-9]+')->name('estimates.detach-project');
    Route::get("/{estimate}/email-client", "Estimates@emailClient")->where('estimate', '[0-9]+')->name('estimates.email-client');
    Route::get("/{estimate}/convert-to-invoice", "Estimates@convertToInvoice")->where('estimate', '[0-9]+')->name('estimates.convert-to-invoice');
    Route::get("/{estimate}/change-status", "Estimates@changeStatus")->where('estimate', '[0-9]+')->name('estimates.change-status');
    Route::post("/{estimate}/change-status", "Estimates@changeStatusUpdate")->where('estimate', '[0-9]+')->name('estimates.change-status.update');
    Route::get("/{estimate}/edit-estimate", "Estimates@show")->middleware(['estimatesMiddlewareEdit', 'estimatesMiddlewareShow'])->name('estimates.edit');
    Route::post("/{estimate}/edit-estimate", "Estimates@saveEstimate")->name('estimates.save');
    Route::get("/view/{estimate}/pdf", "Estimates@showPublic")->name('estimates.show-public.pdf');
    Route::get("/{estimate}/publish", "Estimates@publishEstimate")->where('estimate', '[0-9]+')->middleware(['estimatesMiddlewareEdit', 'estimatesMiddlewareShow'])->name('estimates.publish');
    Route::get("/{estimate}/publish-revised", "Estimates@publishRevisedEstimate")->where('estimate', '[0-9]+')->middleware(['estimatesMiddlewareEdit', 'estimatesMiddlewareShow'])->name('estimates.publish-revised');
    Route::get("/{estimate}/resend", "Estimates@resendEstimate")->where('estimate', '[0-9]+')->middleware(['estimatesMiddlewareEdit', 'estimatesMiddlewareShow'])->name('estimates.resend');
    Route::get("/{estimate}/accept", "Estimates@acceptEstimate")->name('estimates.accept');
    Route::get("/{estimate}/decline", "Estimates@declineEstimate")->name('estimates.decline');
    Route::get("/{estimate}/convert-to-invoice", "Estimates@convertToInvoice")->where('invoice', '[0-9]+')->name('estimates.convert-to-invoice');
    Route::post("/{estimate}/convert-to-invoice", "Estimates@convertToInvoiceAction")->where('invoice', '[0-9]+')->name('estimates.convert-to-invoice.action');
    Route::get("/{estimate}/clone", "Estimates@createClone")->where('estimate', '[0-9]+')->name('estimates.clone');
    Route::post("/{estimate}/clone", "Estimates@storeClone")->where('estimate', '[0-9]+')->name('estimates.clone.store');
    Route::get("/{estimate}/edit-automation", "Estimates@editAutomation")->where('estimate', '[0-9]+')->name('estimates.edit-automation');
    Route::post("/{estimate}/edit-automation", "Estimates@updateAutomation")->where('estimate', '[0-9]+')->name('estimates.update-automation');
    Route::post("/{estimate}/attach-files", "Estimates@attachFiles")->where('estimate', '[0-9]+')->name('estimates.attach-files');
    Route::get("/delete-attachment", "Estimates@deleteFile")->name('estimates.delete-attachment');
    Route::post("/{estimate}/change-tax-type", "Estimates@updateTaxType")->where('estimate', '[0-9]+')->name('estimates.change-tax-type');
    Route::get("/view/{estimate}", "Estimates@showPublic")->name('estimates.show-public');
});

Route::resource('estimates', 'Estimates');

//PAYMENTS
Route::group(['prefix' => 'payments'], function () {
    Route::any("/search", "Payments@index");
    Route::post("/delete", "Payments@destroy")->middleware(['demoModeCheck']);
    Route::get("/change-category", "Payments@changeCategory");
    Route::post("/change-category", "Payments@changeCategoryUpdate");
    Route::any("/v/{payment}", "Payments@index")->where('payment', '[0-9]+');
    Route::any("/thankyou", "Payments@thankYou");
    Route::post("/thankyou/razorpay", "Payments@thankYouRazorpay");
    Route::get("/thankyou/tap", "Payments@thankYouTap");
});
Route::resource('payments', 'Payments');

//ITEMS
Route::group(['prefix' => 'items'], function () {
    Route::any("/search", "Items@index")->name('items.search');
    Route::post("/delete", "Items@destroy")->middleware(['demoModeCheck'])->name('items.delete');
    Route::get("/change-category", "Items@changeCategory")->name('items.change-category');
    Route::post("/change-category", "Items@changeCategoryUpdate")->name('items.change-category.update');
    Route::get("/{item}/tasks", "Items@indexTasks")->where('item', '[0-9]+')->name('items.tasks');
    Route::delete("/tasks/{task}", "Items@destroyTask")->where('task', '[0-9]+')->name('items.tasks.destroy');
    Route::get("/tasks/create", "Items@createTask")->name('items.tasks.create');
    Route::post("/tasks", "Items@storeTask")->name('items.tasks.store');
    Route::get("/tasks/{task}/edit", "Items@editTask")->where('task', '[0-9]+')->name('items.tasks.edit');
    Route::put("/tasks/{task}", "Items@updateTask")->where('task', '[0-9]+')->name('items.tasks.update');
});
Route::resource('items', 'Items');

//PRODUCTS (same as items above)
Route::group(['prefix' => 'products'], function () {
    Route::any("/search", "Items@index")->name('products.search');
    Route::post("/delete", "Items@destroy")->middleware(['demoModeCheck'])->name('products.delete');
    Route::get("/change-category", "Items@changeCategory")->name('products.change-category');
    Route::post("/change-category", "Items@changeCategoryUpdate")->name('products.change-category.update');
});

Route::resource('products', 'Items');

//EXPENSES
Route::group(['prefix' => 'expenses'], function () {
    Route::any("/search", "Expenses@index")->name('expenses.search');
    Route::get("/attachments/download/{uniqueid}", "Expenses@downloadAttachment")->name('expenses.attachments.download');
    Route::delete("/attachments/{uniqueid}", "Expenses@deleteAttachment")->middleware(['demoModeCheck'])->name('expenses.attachments.delete');
    Route::post("/delete", "Expenses@destroy")->middleware(['demoModeCheck'])->name('expenses.delete');
    Route::get("/{expense}/attach-dettach", "Expenses@attachDettach")->where('invoice', '[0-9]+')->name('expenses.attach-dettach');
    Route::post("/{expense}/attach-dettach", "Expenses@attachDettachUpdate")->where('invoice', '[0-9]+')->name('expenses.attach-dettach.update');
    Route::get("/change-category", "Expenses@changeCategory")->name('expenses.change-category');
    Route::post("/change-category", "Expenses@changeCategoryUpdate")->name('expenses.change-category.update');
    Route::get("/{expense}/create-new-invoice", "Expenses@createNewInvoice")->where('expense', '[0-9]+')->name('expenses.create-new-invoice');
    Route::post("/{expense}/create-new-invoice", "Expenses@createNewInvoice")->where('expense', '[0-9]+')->name('expenses.create-new-invoice.store');
    Route::get("/{expense}/add-to-invoice", "Expenses@addToInvoice")->where('expense', '[0-9]+')->name('expenses.add-to-invoice');
    Route::post("/{expense}/add-to-invoice", "Expenses@addToInvoice")->where('expense', '[0-9]+')->name('expenses.add-to-invoice.store');
    Route::any("/v/{expense}", "Expenses@index")->where('expense', '[0-9]+')->name('expenses.v');
});

Route::resource('expenses', 'Expenses');

//PROJECTS & PROJECT
Route::group(['prefix' => 'projects'], function () {
    Route::any("/search", "Projects@index")->name('projects.search');
    Route::post("/delete", "Projects@destroy")->middleware(['demoModeCheck'])->name('projects.delete');
    Route::get("/change-category", "Projects@changeCategory")->name('projects.change-category');
    Route::post("/change-category", "Projects@changeCategoryUpdate")->name('projects.change-category.update');
    Route::get("/{project}/change-status", "Projects@changeStatus")->where('project', '[0-9]+')->name('projects.change-status');
    Route::post("/{project}/change-status", "Projects@changeStatusUpdate")->where('project', '[0-9]+')->name('projects.change-status.update');
    Route::get("/{project}/project-details", "Projects@details")->where('project', '[0-9]+')->name('projects.details');
    Route::post("/{project}/project-details", "Projects@updateDescription")->where('project', '[0-9]+')->name('projects.project-details.update');
    Route::put("/{project}/stop-all-timers", "Projects@stopAllTimers")->where('project', '[0-9]+')->name('projects.stop-all-timers');
    Route::put("/{project}/archive", "Projects@archive")->where('project', '[0-9]+')->name('projects.archive');
    Route::put("/{project}/activate", "Projects@activate")->where('project', '[0-9]+')->name('projects.activate');
    Route::get("/{project}/clone", "Projects@createClone")->where('project', '[0-9]+')->name('projects.clone');
    Route::post("/{project}/clone", "Projects@storeClone")->where('project', '[0-9]+')->name('projects.clone.store');
    Route::get("/prefill-project", "Projects@prefillProject")->name('projects.prefill-project');
    Route::get("/{project}/progress", "Projects@changeProgress")->where('project', '[0-9]+')->name('projects.progress');
    Route::post("/{project}/progress", "Projects@changeProgressUpdate")->where('project', '[0-9]+')->name('projects.progress.update');
    Route::get("/{project}/change-cover-image", "Projects@changeCoverImage")->where('project', '[0-9]+')->name('projects.change-cover-image');
    Route::post("/{project}/change-cover-image", "Projects@changeCoverImageUpdate")->where('project', '[0-9]+')->name('projects.change-cover-image.update');
    Route::get("/{project}/assigned", "Projects@assignedUsers")->where('project', '[0-9]+')->name('projects.assigned');
    Route::put("/{project}/assigned", "Projects@assignedUsersUpdate")->where('project', '[0-9]+')->name('projects.assigned.update');
    Route::get("/{project}/edit-automation", "Projects@editAutomation")->where('project', '[0-9]+')->name('projects.edit-automation');
    Route::post("/{project}/edit-automation", "Projects@updateAutomation")->where('project', '[0-9]+')->name('projects.update-automation');
    Route::get("/{project}/set-cover-image", "Projects@setFileBasedCoverImage")->where('project', '[0-9]+')->name('projects.set-cover-image');
    Route::post("/{project}/remove-cover-image", "Projects@removeCoverImage")->where('project', '[0-9]+')->name('projects.remove-cover-image');
    Route::get("/change-assigned", "Projects@BulkchangeAssigned")->name('projects.bulk-change-assigned');
    Route::post("/change-assigned", "Projects@BulkchangeAssignedUpdate")->name('projects.bulk-change-assigned.update');
    Route::get("/bulk-change-status", "Projects@BulkChangeStatus")->name('projects.bulk-change-status');
    Route::post("/bulk-change-status", "Projects@BulkChangeStatusUpdate")->name('projects.bulk-change-status.update');

    //dynamic load
    Route::any("/{project}/{section}", "Projects@showDynamic")
        ->where(['project' => '[0-9]+', 'section' => 'details|comments|files|tasks|invoices|payments|timesheets|expenses|estimates|milestones|tickets|notes'])
        ->name('projects.show-dynamic');
});

Route::resource('projects', 'Projects');
//TASKS
Route::group(['prefix' => 'tasks'], function () {
    Route::any("/search", "Tasks@index")->name('tasks.search');
    Route::any("/timer/{id}/start", "Tasks@timerStart")->where('id', '[0-9]+')->name('tasks.timer.start');
    Route::any("/timer/{id}/stop", "Tasks@timerStop")->where('id', '[0-9]+')->name('tasks.timer.stop');
    Route::any("/timer/stop", "Tasks@timerStopUser")->name('tasks.timer.stop-user');
    Route::any("/timer/{id}/stopall", "Tasks@timerStopAll")->where('id', '[0-9]+')->name('tasks.timer.stop-all');
    Route::post("/delete", "Tasks@destroy")->middleware(['demoModeCheck'])->name('tasks.delete');
    Route::post("/{task}/toggle-status", "Tasks@toggleStatus")->where('task', '[0-9]+')->name('tasks.toggle-status');
    Route::post("/{task}/update-description", "Tasks@updateDescription")->where('task', '[0-9]+')->name('tasks.update-description');
    Route::post("/{task}/attach-files", "Tasks@attachFiles")->where('task', '[0-9]+')->name('tasks.attach-files');
    Route::delete("/delete-attachment/{uniqueid}", "Tasks@deleteAttachment")->middleware(['demoModeCheck'])->name('tasks.delete-attachment');
    Route::get("/download-attachment/{uniqueid}", "Tasks@downloadAttachment")->name('tasks.download-attachment');
    Route::post("/{task}/post-comment", "Tasks@storeComment")->where('task', '[0-9]+')->name('tasks.post-comment');
    Route::delete("/delete-comment/{commentid}", "Tasks@deleteComment")->where('commentid', '[0-9]+')->name('tasks.delete-comment');
    Route::post("/{task}/update-title", "Tasks@updateTitle")->where('task', '[0-9]+')->name('tasks.update-title');
    Route::post("/{task}/add-checklist", "Tasks@storeChecklist")->where('task', '[0-9]+')->name('tasks.add-checklist');
    Route::post("/update-checklist/{checklistid}", "Tasks@updateChecklist")->where('checklistid', '[0-9]+')->name('tasks.update-checklist');
    Route::delete("/delete-checklist/{checklistid}", "Tasks@deleteChecklist")->where('checklistid', '[0-9]+')->name('tasks.delete-checklist');
    Route::post("/toggle-checklist-status/{checklistid}", "Tasks@toggleChecklistStatus")->where('checklistid', '[0-9]+')->name('tasks.toggle-checklist-status');
    Route::post("/{task}/update-start-date", "Tasks@updateStartDate")->where('task', '[0-9]+')->name('tasks.update-start-date');
    Route::post("/{task}/update-due-date", "Tasks@updateDueDate")->where('task', '[0-9]+')->name('tasks.update-due-date');
    Route::post("/{task}/update-status", "Tasks@updateStatus")->where('task', '[0-9]+')->name('tasks.update-status');
    Route::post("/{task}/update-priority", "Tasks@updatePriority")->where('task', '[0-9]+')->name('tasks.update-priority');
    Route::post("/{task}/update-visibility", "Tasks@updateVisibility")->where('task', '[0-9]+')->name('tasks.update-visibility');
    Route::post("/{task}/update-milestone", "Tasks@updateMilestone")->where('task', '[0-9]+')->name('tasks.update-milestone');
    Route::post("/{task}/update-assigned", "Tasks@updateAssigned")->where('task', '[0-9]+')->name('tasks.update-assigned');
    Route::post("/{task}/update-tags", "Tasks@updateTags")->where('task', '[0-9]+')->name('tasks.update-tags');
    Route::post("/update-position", "Tasks@updatePosition")->name('tasks.update-position');
    Route::any("/v/{task}/{slug}", "Tasks@index")->where('task', '[0-9]+')->name('tasks.v-slug');
    Route::any("/v/{task}", "Tasks@index")->where('task', '[0-9]+')->name('tasks.v');
    Route::post("/{task}/update-custom", "Tasks@updateCustomFields")->where('task', '[0-9]+')->name('tasks.update-custom');
    Route::put("/{task}/archive", "Tasks@archive")->where('task', '[0-9]+')->name('tasks.archive');
    Route::put("/{task}/activate", "Tasks@activate")->where('task', '[0-9]+')->name('tasks.activate');
    Route::get("/{task}/clone", "Tasks@cloneTask")->where('task', '[0-9]+')->name('tasks.clone');
    Route::post("/{task}/clone", "Tasks@cloneStore")->where('task', '[0-9]+')->name('tasks.clone.store');
    Route::get("/{task}/recurring-settings", "Tasks@recurringSettings")->where('task', '[0-9]+')->name('tasks.recurring-settings');
    Route::post("/{task}/recurring-settings", "Tasks@recurringSettingsUpdate")->where('task', '[0-9]+')->name('tasks.recurring-settings.update');
    Route::get("/{task}/stop-recurring", "Tasks@stopRecurring")->where('task', '[0-9]+')->name('tasks.stop-recurring');
    Route::post("/{task}/add-dependency", "Tasks@storeDependency")->where('task', '[0-9]+')->name('tasks.add-dependency');
    Route::delete("/{task}/delete-dependency", "Tasks@deleteDependency")->where('task', '[0-9]+')->name('tasks.delete-dependency');

    //card tabs
    Route::get("/content/{task}/show-main", "Tasks@show")->where('lead', '[0-9]+')->name('tasks.content.show-main');
    Route::get("/content/{task}/show-customfields", "Tasks@showCustomFields")->where('task', '[0-9]+')->name('tasks.content.show-customfields');
    Route::get("/content/{task}/edit-customfields", "Tasks@editCustomFields")->where('task', '[0-9]+')->name('tasks.content.edit-customfields');
    Route::post("/content/{task}/edit-customfields", "Tasks@updateCustomFields")->where('task', '[0-9]+')->name('tasks.content.update-customfields');
    Route::get("/content/{task}/show-mynotes", "Tasks@showMyNotes")->where('task', '[0-9]+')->name('tasks.content.show-mynotes');
    Route::get("/content/{task}/create-mynotes", "Tasks@createMyNotes")->where('task', '[0-9]+')->name('tasks.content.create-mynotes');
    Route::get("/content/{task}/edit-mynotes", "Tasks@editMyNotes")->where('task', '[0-9]+')->name('tasks.content.edit-mynotes');
    Route::delete("/content/{task}/delete-mynotes", "Tasks@deleteMyNotes")->where('task', '[0-9]+')->name('tasks.content.delete-mynotes');
    Route::post("/content/{task}/edit-mynotes", "Tasks@updateMyNotes")->where('task', '[0-9]+')->name('tasks.content.update-mynotes');
});

Route::resource('tasks', 'Tasks');

//LEADS & LEAD
Route::group(['prefix' => 'leads'], function () {
    Route::any("/search", "Leads@index")->name('leads.search');
    Route::any("/{lead}/details", "Leads@details")->where('lead', '[0-9]+')->name('leads.details');
    Route::post("/delete", "Leads@destroy")->middleware(['demoModeCheck'])->name('leads.delete');
    Route::get("/change-category", "Leads@changeCategory")->name('leads.change-category');
    Route::post("/change-category", "Leads@changeCategoryUpdate")->name('leads.change-category-update');
    Route::get("/{lead}/change-status", "Leads@changeStatus")->where('lead', '[0-9]+')->name('leads.change-status');
    Route::post("/{lead}/change-status", "Leads@changeStatusUpdate")->where('lead', '[0-9]+')->name('leads.change-status-update');
    Route::post("/{lead}/update-description", "Leads@updateDescription")->where('lead', '[0-9]+')->name('leads.update-description');
    Route::post("/{lead}/attach-files", "Leads@attachFiles")->where('lead', '[0-9]+')->name('leads.attach-files');
    Route::delete("/delete-attachment/{uniqueid}", "Leads@deleteAttachment")->name('leads.delete-attachment');
    Route::get("/download-attachment/{uniqueid}", "Leads@downloadAttachment")->name('leads.download-attachment');
    Route::post("/{lead}/update-title", "Leads@updateTitle")->where('lead', '[0-9]+')->name('leads.update-title');
    Route::post("/{lead}/post-comment", "Leads@storeComment")->where('lead', '[0-9]+')->name('leads.post-comment');
    Route::delete("/delete-comment/{commentid}", "Leads@deleteComment")->where('commentid', '[0-9]+')->name('leads.delete-comment');
    Route::post("/{lead}/add-checklist", "Leads@storeChecklist")->where('lead', '[0-9]+')->name('leads.add-checklist');
    Route::post("/update-checklist/{checklistid}", "Leads@updateChecklist")->where('checklistid', '[0-9]+')->name('leads.update-checklist');
    Route::delete("/delete-checklist/{checklistid}", "Leads@deleteChecklist")->where('checklistid', '[0-9]+')->name('leads.delete-checklist');
    Route::post("/toggle-checklist-status/{checklistid}", "Leads@toggleChecklistStatus")->where('checklistid', '[0-9]+')->name('leads.toggle-checklist-status');
    Route::post("/{lead}/update-date-added", "Leads@updateDateAdded")->where('lead', '[0-9]+')->name('leads.update-date-added');
    Route::post("/{lead}/update-name", "Leads@updateName")->where('lead', '[0-9]+')->name('leads.update-name');
    Route::post("/{lead}/update-value", "Leads@updateValue")->where('lead', '[0-9]+')->name('leads.update-value');
    Route::post("/{lead}/update-status", "Leads@updateStatus")->where('lead', '[0-9]+')->name('leads.update-status');
    Route::post("/{lead}/update-category", "Leads@updateCategory")->where('lead', '[0-9]+')->name('leads.update-category');
    Route::post("/{lead}/update-contacted", "Leads@updateContacted")->where('lead', '[0-9]+')->name('leads.update-contacted');
    Route::post("/{lead}/update-phone", "Leads@updatePhone")->where('lead', '[0-9]+')->name('leads.update-phone');
    Route::post("/{lead}/update-email", "Leads@updateEmail")->where('lead', '[0-9]+')->name('leads.update-email');
    Route::post("/{lead}/update-source", "Leads@updateSource")->where('lead', '[0-9]+')->name('leads.update-source');
    Route::post("/{lead}/update-organisation", "Leads@updateOrganisation")->where('lead', '[0-9]+')->name('leads.update-organisation');
    Route::post("/{lead}/update-assigned", "Leads@updateAssigned")->where('lead', '[0-9]+')->name('leads.update-assigned');
    Route::post("/{lead}/update-tags", "Leads@updateTags")->where('lead', '[0-9]+')->name('leads.update-tags');
    Route::post("/update-position", "Leads@updatePosition")->name('leads.update-position');
    Route::post("/{lead}/convert-lead", "Leads@convertLead")->where('lead', '[0-9]+')->name('leads.convert-lead');
    Route::get("/{lead}/convert-details", "Leads@convertDetails")->where('lead', '[0-9]+')->name('leads.convert-details');
    Route::any("/v/{lead}/{slug}", "Leads@index")->where('lead', '[0-9]+')->name('leads.v-slug');
    Route::post("/{lead}/update-custom", "Leads@updateCustomFields")->where('lead', '[0-9]+')->name('leads.update-custom');
    Route::put("/{lead}/archive", "Leads@archive")->where('lead', '[0-9]+')->name('leads.archive');
    Route::put("/{lead}/activate", "Leads@activate")->where('lead', '[0-9]+')->name('leads.activate');
    Route::get("/{lead}/clone", "Leads@cloneLead")->where('lead', '[0-9]+')->name('leads.clone');
    Route::post("/{lead}/clone", "Leads@cloneStore")->where('lead', '[0-9]+')->name('leads.clone-store');
    Route::get("/{lead}/assigned", "Leads@assignedUsers")->where('lead', '[0-9]+')->name('leads.assigned');
    Route::put("/{lead}/assigned", "Leads@assignedUsersUpdate")->where('lead', '[0-9]+')->name('leads.assigned-update');
    Route::get("/change-assigned", "Leads@BulkchangeAssigned")->name('leads.bulkchange-assigned');
    Route::post("/change-assigned", "Leads@BulkchangeAssignedUpdate")->name('leads.bulkchange-assigned-update');
    Route::get("/bulk-change-status", "Leads@BulkChangeStatus")->name('leads.bulk-change-status');
    Route::post("/bulk-change-status", "Leads@BulkChangeStatusUpdate")->name('leads.bulk-change-status-update');

    //card tabs
    Route::get("/content/{lead}/show-main", "Leads@show")->where('lead', '[0-9]+')->name('leads.content.show-main');
    Route::get("/content/{lead}/show-organisation", "Leads@showOrganisation")->where('lead', '[0-9]+')->name('leads.content.show-organisation');
    Route::get("/content/{lead}/edit-organisation", "Leads@editOrganisation")->where('lead', '[0-9]+')->name('leads.content.edit-organisation');
    Route::post("/content/{lead}/edit-organisation", "Leads@updateOrganisation")->where('lead', '[0-9]+')->name('leads.content.update-organisation');
    Route::get("/content/{lead}/show-customfields", "Leads@showCustomFields")->where('lead', '[0-9]+')->name('leads.content.show-customfields');
    Route::get("/content/{lead}/edit-customfields", "Leads@editCustomFields")->where('lead', '[0-9]+')->name('leads.content.edit-customfields');
    Route::post("/content/{lead}/edit-customfields", "Leads@updateCustomFields")->where('lead', '[0-9]+')->name('leads.content.update-customfields');
    Route::get("/content/{lead}/show-mynotes", "Leads@showMyNotes")->where('lead', '[0-9]+')->name('leads.content.show-mynotes');
    Route::get("/content/{lead}/create-mynotes", "Leads@createMyNotes")->where('lead', '[0-9]+')->name('leads.content.create-mynotes');
    Route::get("/content/{lead}/edit-mynotes", "Leads@editMyNotes")->where('lead', '[0-9]+')->name('leads.content.edit-mynotes');
    Route::delete("/content/{lead}/delete-mynotes", "Leads@deleteMyNotes")->where('lead', '[0-9]+')->name('leads.content.delete-mynotes');
    Route::post("/content/{lead}/edit-mynotes", "Leads@updateMyNotes")->where('lead', '[0-9]+')->name('leads.content.update-mynotes');
    Route::get("/content/{lead}/show-logs", "Leads@showLogs")->where('lead', '[0-9]+')->name('leads.content.show-logs');
    Route::get("/content/{lead}/edit-logs", "Leads@editLogs")->where('lead', '[0-9]+')->name('leads.content.edit-logs');
    Route::post("/content/{lead}/edit-logs", "Leads@updateLogs")->where('lead', '[0-9]+')->name('leads.content.update-logs');

});
Route::resource('leads', 'Leads');


//TICKETS
Route::group(['prefix' => 'tickets'], function () {
    Route::any("/search", "Tickets@index")->name('tickets.search');
    Route::get("/{x}/editdetails", "Tickets@editDetails")->where('x', '[0-9]+')->name('tickets.editdetails');
    Route::get("/{ticket}/reply", "Tickets@reply")->where('x', '[0-9]+')->name('tickets.reply');
    Route::post("/{ticket}/postreply", "Tickets@storeReply")->where('x', '[0-9]+')->name('tickets.postreply');
    Route::post("/delete", "Tickets@destroy")->middleware(['demoModeCheck'])->name('tickets.delete');
    Route::get("/change-category", "Tickets@changeCategory")->name('tickets.change-category');
    Route::post("/change-category", "Tickets@changeCategoryUpdate")->name('tickets.change-category-update');
    Route::get("/attachments/download/{uniqueid}", "Tickets@downloadAttachment")->name('tickets.download-attachment');
    Route::get("/{ticket}/edit-reply", "Tickets@editReply")->where('ticket', '[0-9]+')->name('tickets.edit-reply');
    Route::post("/{ticket}/edit-reply", "Tickets@updateReply")->where('ticket', '[0-9]+')->name('tickets.update-reply');
    Route::delete("/{ticket}/delete-reply", "Tickets@deleteReply")->where('ticket', '[0-9]+')->name('tickets.delete-reply');
    Route::any("/archive", "Tickets@archive")->name('tickets.archive');
    Route::any("/restore", "Tickets@restore")->name('tickets.restore');
    Route::get("/change-status", "Tickets@changeStatus")->name('tickets.change-status');
    Route::post("/change-status", "Tickets@changeStatusUpdate")->name('tickets.change-status-update');

});
Route::resource('tickets', 'Tickets');


//TIMELINE
Route::group(['prefix' => 'timeline'], function () {
    Route::any("/client", "Timeline@clientTimeline")->name('timeline.client');
    Route::any("/project", "Timeline@projectTimeline")->name('timeline.project');
});


//TIMESHEETS
Route::group(['prefix' => 'timesheets'], function () {
    Route::any("/my", "Timesheets@index")->name('timesheets.my');
    Route::any("/", "Timesheets@index")->name('timesheets.index');
    Route::any("/search", "Timesheets@index")->name('timesheets.search');
    Route::post("/delete", "Timesheets@destroy")->middleware(['demoModeCheck'])->name('timesheets.delete');
});
Route::resource('timesheets', 'Timesheets');


//FILES
Route::group(['prefix' => 'files'], function () {
    Route::any("/search", "Files@index")->name('files.search');
    Route::get("/getimage", "Files@showImage")->name('files.showImage');
    Route::get("/download", "Files@download")->name('files.download');
    Route::post("/delete", "Files@destroy")->middleware(['demoModeCheck'])->name('files.delete');
    Route::post("/{file}/rename", "Files@renameFile")->middleware(['demoModeCheck'])->name('files.rename');
    Route::get("/folders/show", "Files@showFolders")->name('files.folders.show');
    Route::get("/folders/create", "Files@createFolder")->name('files.folders.create');
    Route::post("/folders/create", "Files@storeFolder")->name('files.folders.store');
    Route::get("/folders/edit", "Files@editFolders")->name('files.folders.edit');
    Route::post("/folders/update", "Files@updateFolders")->name('files.folders.update');
    Route::delete("/folders/{folder}/delete", "Files@deleteFolder")->where('folder', '[0-9]+')->middleware(['demoModeCheck'])->name('files.folders.delete');
    Route::post("/move", "Files@ShowMoveFiles")->name('files.move');
    Route::put("/move", "Files@moveFiles")->middleware(['demoModeCheck'])->name('files.moveFiles');
    Route::post("/bulkdownload", "Files@bulkDownload")->name('files.bulkDownload');
    Route::get("/copy", "Files@copy")->name('files.copy');
    Route::post("/copy", "Files@copyAction")->name('files.copyAction');
});
Route::resource('files', 'Files');


//NOTES
Route::group(['prefix' => 'notes'], function () {
    Route::any("/search", "Notes@index")->name('notes.search');
    Route::post("/delete", "Notes@destroy")->middleware(['demoModeCheck'])->name('notes.delete');
});
Route::resource('notes', 'Notes');


//COMMENTS
Route::group(['prefix' => 'comments'], function () {
    Route::any("/search", "Comments@index")->name('comments.search');
    Route::post("/delete", "Comments@destroy")->middleware(['demoModeCheck'])->name('comments.delete');
});
Route::resource('comments', 'Comments');


//DOCUMENTS (proposals & contracts)
Route::group(['prefix' => 'documents'], function () {
    Route::post("/{document}/update/hero", "Documents@updateHero")->where('document', '[0-9]+')->name('documents.update.hero');
    Route::post("/{document}/update/details", "Documents@updateDetails")->where('document', '[0-9]+')->name('documents.update.details');
    Route::post("/{document}/update/body", "Documents@updateBody")->where('document', '[0-9]+')->name('documents.update.body');
});


//PROPOSALS
Route::resource('proposals', 'Proposals');
Route::group(['prefix' => 'proposals'], function () {
    Route::any("/search", "Proposals@index")->name('proposals.search');
    Route::post("/delete", "Proposals@destroy")->middleware(['demoModeCheck'])->name('proposals.delete');
    Route::get("/change-category", "Proposals@changeCategory")->name('proposals.change_category');
    Route::post("/change-category", "Proposals@changeCategoryUpdate")->name('proposals.update_category');
    Route::get("/{proposal}", "Proposals@show")->where('proposal', '[0-9]+')->name('proposals.show');
    Route::get("/{proposal}/edit", "Proposals@editingProposal")->where('proposal', '[0-9]+')->name('proposals.edit');
    Route::get("/{proposal}/publish", "Proposals@publish")->where('proposal', '[0-9]+')->name('proposals.publish');
    Route::get("/{proposal}/resend", "Proposals@resendEmail")->where('proposal', '[0-9]+')->name('proposals.resend');
    Route::get("/view/{proposal}", "Proposals@showPublic")->name('proposals.show_public');
    Route::get("/{proposal}/change-status", "Proposals@changeStatus")->where('proposal', '[0-9]+')->name('proposals.change_status');
    Route::get("/{proposal}/sign", "Proposals@sign")->name('proposals.sign');
    Route::post("/{proposal}/accept", "Proposals@accepted")->name('proposals.accept');
    Route::get("/{proposal}/decline", "Proposals@declined")->name('proposals.decline');
});



//CONTRACTS
Route::resource('contracts', 'Contracts');
Route::group(['prefix' => 'contracts'], function () {
    Route::any("/search", "Contracts@index")->name('contracts.search');
    Route::post("/delete", "Contracts@destroy")->middleware(['demoModeCheck'])->name('contracts.delete');
    Route::get("/change-category", "Contracts@changeCategory")->name('contracts.change_category');
    Route::post("/change-category", "Contracts@changeCategoryUpdate")->name('contracts.update_category');
    Route::get("/{contract}", "Contracts@show")->where('contract', '[0-9]+')->name('contracts.show');
    Route::get("/{contract}/edit", "Contracts@editingContract")->where('contract', '[0-9]+')->name('contracts.edit');
    Route::get("/{contract}/publish", "Contracts@publish")->where('contract', '[0-9]+')->name('contracts.publish');
    Route::get("/{contract}/resend", "Contracts@resendEmail")->where('contract', '[0-9]+')->name('contracts.resend');
    Route::get("/view/{contract}", "Contracts@showPublic")->name('contracts.show_public');
    Route::get("/{contract}/change-status", "Contracts@changeStatus")->where('contract', '[0-9]+')->name('contracts.change_status');
    Route::get("/{contract}/sign/team", "Contracts@signTeam")->name('contracts.sign_team');
    Route::post("/{contract}/sign/team", "Contracts@signTeamAction")->name('contracts.sign_team_action');
    Route::get("/{contract}/sign/client", "Contracts@signClient")->name('contracts.sign_client');
    Route::post("/{contract}/sign/client", "Contracts@signClientAction")->name('contracts.sign_client_action');
    Route::delete("/{contract}/sign/delete-signature", "Contracts@signDeleteSignature")->name('contracts.sign_delete_signature');
    Route::get("/{contract}/attach-project", "Contracts@attachProject")->where('invoice', '[0-9]+')->name('contracts.attach_project');
    Route::post("/{contract}/attach-project", "Contracts@attachProjectUpdate")->where('invoice', '[0-9]+')->name('contracts.attach_project_update');
    Route::get("/{contract}/detach-project", "Contracts@dettachProject")->where('invoice', '[0-9]+')->name('contracts.detach_project');
});


//CONTRACT TEMPLATES
Route::resource('templates/contracts', 'Templates\Contracts');

//PROPOSAL TEMPLATES
Route::resource('templates/proposals', 'Templates\Proposals');

//AUTOCOMPLETE AJAX FEED
Route::group(['prefix' => 'feed'], function () {
    Route::get("/", "Feed@index")->name('feed.index');
    Route::get("/company_names", "Feed@companyNames")->name('feed.company_names');
    Route::get("/contacts", "Feed@contactNames")->name('feed.contact_names');
    Route::get("/email", "Feed@emailAddress")->name('feed.email_address');
    Route::get("/tags", "Feed@tags")->name('feed.tags');
    Route::get("/leads", "Feed@leads")->name('feed.leads');
    Route::get("/leadnames", "Feed@leadNames")->name('feed.lead_names');
    Route::get("/projects", "Feed@projects")->name('feed.projects');
    Route::get("/projectassigned", "Feed@projectAssignedUsers")->name('feed.project_assigned_users');
    Route::get("/projects-my-assigned-task", "Feed@projectAssignedTasks")->name('feed.project_assigned_tasks');
    Route::get("/clone-task-projects", "Feed@cloneTaskProjects")->name('feed.clone_task_projects');
    Route::get("/project-milestones", "Feed@projectsMilestones")->name('feed.project_milestones');
    Route::get("/project-client-users", "Feed@projectClientUsers")->name('feed.project_client_users');
});


//PROJECTS & PROJECT
Route::group(['prefix' => 'feed'], function () {
    Route::any("/team", "Team@index")->name('feed.team'); //[TODO]  auth middleware
});

Route::group(['prefix' => 'milestones'], function () {
    Route::any("/search", "Milestones@index")->name('milestones.search');
    Route::post("/update-positions", "Milestones@updatePositions")->name('milestones.update_positions');
});
Route::resource('milestones', 'Milestones');

//CATEGORIES
Route::group(['prefix' => 'categories'], function () {
    Route::any("/", "Categories@index")->name('categories.index');
    Route::get("/{category}/team", "Categories@showTeam")->where('category', '[0-9]+')->name('categories.team.show');
    Route::put("/{category}/team", "Categories@updateTeam")->where('category', '[0-9]+')->name('categories.team.update');
});

Route::resource('categories', 'Categories');


Route::post("/fileupload", "Fileupload@save")->name('fileupload.save');
Route::post("/webform/fileupload", "Fileupload@saveWebForm")->name('fileupload.saveWebForm');


//AVATAR FILEUPLOAD
Route::post("/avatarupload", "Fileupload@saveAvatar")->name('avatarupload.save');

//CLIENT LOGO FILEUPLOAD
Route::post("/uploadlogo", "Fileupload@saveLogo")->name('uploadlogo.save');

//APP LOGO FILEUPLOAD
Route::post("/upload-app-logo", "Fileupload@saveAppLogo")->name('upload.app.logo');

//TINYMCE IMAGE FILEUPLOAD
Route::post("/upload-tinymce-image", "Fileupload@saveTinyMCEImage")->name('upload.tinymce.image');

//COVER IMAGE UPLAOD
Route::post("/upload-cover-image", "Fileupload@uploadCoverImage")->name('upload.cover.image');

//GENERAL IMAGE UPLAOD
Route::post("/upload-general-image", "Fileupload@saveGeneralImage")->name('upload.general.image');

//TAGS - GENERAL
Route::group(['prefix' => 'tags'], function () {
    Route::any("/search", "Tags@index")->name('tags.search');
});
Route::resource('tags', 'Tags');


Route::group(['prefix' => 'knowledgebase'], function () {
    //category
    Route::get("/", "KBCategories@index")->name('knowledgebase.index');
});
Route::resource('knowledgebase', 'KBCategories');

//KNOWLEDGEBASE - ARTICLES
Route::group(['prefix' => 'kb'], function () {
    //category
    Route::any("/search", "Knowledgebase@index")->name('kb.search');
    //pretty url domain.com/kb/12/some-category-title
    Route::any("/articles/{slug}", "Knowledgebase@index")->name('kb.articles');
    Route::any("/article/{slug}", "Knowledgebase@show")->name('kb.article');
});
Route::resource('kb', 'Knowledgebase');


//SETTINGS - HOME
Route::group(['prefix' => 'settings'], function () {
    Route::get("/", "Settings\Home@index")->name('settings.home');
});


//SETTINGS - SYSTEM
Route::group(['prefix' => 'settings/system'], function () {
    Route::get("/clearcache", "Settings\System@clearLaravelCache")->name('settings.system.clearcache');
});


//SETTINGS - GENERAL
Route::group(['prefix' => 'settings/general'], function () {
    Route::get("/", "Settings\General@index")->name('settings.general.index');
    Route::put("/", "Settings\General@update")->middleware(['demoModeCheck'])->name('settings.general.update');
});

//SETTINGS - MODULES
Route::group(['prefix' => 'settings/modules'], function () {
    Route::get("/", "Settings\Modules@index")->name('settings.modules.index');
    Route::put("/", "Settings\Modules@update")->middleware(['demoModeCheck'])->name('settings.modules.update');
});


//SETTINGS - COMPANY
Route::group(['prefix' => 'settings/company'], function () {
    Route::get("/", "Settings\Company@index")->name('settings.company.index');
    Route::put("/", "Settings\Company@update")->middleware(['demoModeCheck'])->name('settings.company.update');
});

//SETTINGS - CURRENCY
Route::group(['prefix' => 'settings/currency'], function () {
    Route::get("/", "Settings\Currency@index")->name('settings.currency.index');
    Route::put("/", "Settings\Currency@update")->middleware(['demoModeCheck'])->name('settings.currency.update');
});


//SETTINGS - THEME
Route::group(['prefix' => 'settings/theme'], function () {
    Route::get("/", "Settings\Theme@index")->name('settings.theme.index');
    Route::put("/", "Settings\Theme@update")->middleware(['demoModeCheck'])->name('settings.theme.update');
});


//SETTINGS - CLIENT
Route::group(['prefix' => 'settings/clients'], function () {
    Route::get("/", "Settings\Clients@index")->name('settings.clients.index');
    Route::put("/", "Settings\Clients@update")->middleware(['demoModeCheck'])->name('settings.clients.update');
});


//SETTINGS - TAGS
Route::group(['prefix' => 'settings/tags'], function () {
    Route::get("/", "Settings\Tags@index")->name('settings.tags.index');
    Route::put("/", "Settings\Tags@update")->middleware(['demoModeCheck'])->name('settings.tags.update');
});


//SETTINGS - PROJECT
Route::group(['prefix' => 'settings/projects'], function () {
    Route::get("/general", "Settings\Projects@general")->name('settings.projects.general');
    Route::put("/general", "Settings\Projects@updateGeneral")->middleware(['demoModeCheck'])->name('settings.projects.updateGeneral');
    Route::get("/client", "Settings\Projects@clientPermissions")->name('settings.projects.client');
    Route::put("/client", "Settings\Projects@updateClientPermissions")->middleware(['demoModeCheck'])->name('settings.projects.updateClientPermissions');
    Route::get("/staff", "Settings\Projects@staffPermissions")->name('settings.projects.staff');
    Route::put("/staff", "Settings\Projects@updateStaffPermissions")->middleware(['demoModeCheck'])->name('settings.projects.updateStaffPermissions');
    Route::get("/automation", "Settings\Projects@automation")->name('settings.projects.automation');
    Route::put("/automation", "Settings\Projects@automationUpdate")->name('settings.projects.updateAutomation');
});


//SETTINGS - INVOICES
Route::group(['prefix' => 'settings/invoices'], function () {
    Route::get("/", "Settings\Invoices@index")->name('settings.invoices.index');
    Route::put("/", "Settings\Invoices@update")->middleware(['demoModeCheck'])->name('settings.invoices.update');
});

//SETTINGS - SUBSCRIPTIONS
Route::group(['prefix' => 'settings/subscriptions'], function () {
    Route::get("/", "Settings\Subscriptions@index")->name('settings.subscriptions.index');
    Route::put("/", "Settings\Subscriptions@update")->middleware(['demoModeCheck'])->name('settings.subscriptions.update');
});


//SETTINGS - UNITS
Route::group(['prefix' => 'settings/units'], function () {
    Route::get("/", "Settings\Units@index")->name('settings.units.index');
    Route::put("/", "Settings\Units@update")->middleware(['demoModeCheck'])->name('settings.units.update');
});
Route::resource('settings.units', 'Settings\Units')->except(['index', 'update']);


Route::group(['prefix' => 'settings/taxrates'], function () {
    Route::get("/", "Settings\Taxrates@index")->name('settings.taxrates.index');
    Route::put("/", "Settings\Taxrates@update")->middleware(['demoModeCheck'])->name('settings.taxrates.update');
});

Route::resource('settings/taxrates', 'Settings\Taxrates');

//SETTINGS - ESTIMATES
Route::group(['prefix' => 'settings/estimates'], function () {
    Route::get("/", "Settings\Estimates@index")->name('settings.estimates.index');
    Route::put("/", "Settings\Estimates@update")->middleware(['demoModeCheck'])->name('settings.estimates.update');
    Route::get("/automation", "Settings\Estimates@automation")->name('settings.estimates.automation');
    Route::put("/automation", "Settings\Estimates@automationUpdate")->name('settings.estimates.automationUpdate');
});





//SETTINGS - CONTRACTS
Route::group(['prefix' => 'settings/contracts'], function () {
    Route::get("/", "Settings\Contracts@index")->name('settings.contracts.index');
    Route::put("/", "Settings\Contracts@update")->middleware(['demoModeCheck'])->name('settings.contracts.update');
});

//SETTINGS - PROPOSALS
Route::group(['prefix' => 'settings/proposals'], function () {
    Route::get("/", "Settings\Proposals@index")->name('settings.proposals.index');
    Route::put("/", "Settings\Proposals@update")->middleware(['demoModeCheck'])->name('settings.proposals.update');
});

//SETTINGS - EXPENSES
Route::group(['prefix' => 'settings/expenses'], function () {
    Route::get("/", "Settings\Expenses@index")->name('settings.expenses.index');
    Route::put("/", "Settings\Expenses@update")->middleware(['demoModeCheck'])->name('settings.expenses.update');
});


//SETTINGS - STRIPE
Route::group(['prefix' => 'settings/stripe'], function () {
    Route::get("/", "Settings\Stripe@index")->middleware(['demoModeCheck'])->name('settings.stripe.index');
    Route::put("/", "Settings\Stripe@update")->middleware(['demoModeCheck'])->name('settings.stripe.update');
});


//SETTINGS - RAZORPAY
Route::group(['prefix' => 'settings/razorpay'], function () {
    Route::get("/", "Settings\Razorpay@index")->middleware(['demoModeCheck'])->name('settings.razorpay.index');
    Route::put("/", "Settings\Razorpay@update")->middleware(['demoModeCheck'])->name('settings.razorpay.update');
});


//SETTINGS - MOLLIE
Route::group(['prefix' => 'settings/mollie'], function () {
    Route::get("/", "Settings\Mollie@index")->middleware(['demoModeCheck'])->name('settings.mollie.index');
    Route::put("/", "Settings\Mollie@update")->middleware(['demoModeCheck'])->name('settings.mollie.update');
});


//SETTINGS - PAYPAL
Route::group(['prefix' => 'settings/paypal'], function () {
    Route::get("/", "Settings\Paypal@index")->middleware(['demoModeCheck'])->name('settings.paypal.index');
    Route::put("/", "Settings\Paypal@update")->middleware(['demoModeCheck'])->name('settings.paypal.update');
});


//SETTINGS - TAP
Route::group(['prefix' => 'settings/tap'], function () {
    Route::get("/", "Settings\Tap@index")->middleware(['demoModeCheck'])->name('settings.tap.index');
    Route::put("/", "Settings\Tap@update")->middleware(['demoModeCheck'])->name('settings.tap.update');
});


//SETTINGS - PAYSTACK
Route::group(['prefix' => 'settings/paystack'], function () {
    Route::get("/", "Settings\Paystack@index")->middleware(['demoModeCheck'])->name('settings.paystack.index');
    Route::put("/", "Settings\Paystack@update")->middleware(['demoModeCheck'])->name('settings.paystack.update');
});

//SETTINGS - BANK
Route::group(['prefix' => 'settings/bank'], function () {
    Route::get("/", "Settings\Bank@index")->middleware(['demoModeCheck'])->name('settings.bank.index');
    Route::put("/", "Settings\Bank@update")->middleware(['demoModeCheck'])->name('settings.bank.update');
});


//SETTINGS - LEADS
Route::group(['prefix' => 'settings/leads'], function () {
    Route::get("/general", "Settings\Leads@general");
    Route::put("/general", "Settings\Leads@updateGeneral");
    Route::get("/statuses", "Settings\Leads@statuses");
    Route::put("/statuses", "Settings\Leads@updateStatuses")->middleware(['demoModeCheck']);
    Route::get("/statuses/{id}/edit", "Settings\Leads@editStatus")->where('lead', '[0-9]+');
    Route::put("/statuses/{id}", "Settings\Leads@updateStatus")->where('lead', '[0-9]+')->middleware(['demoModeCheck']);
    Route::get("/statuses/create", "Settings\Leads@createStatus");
    Route::post("/statuses/create", "Settings\Leads@storeStatus");
    Route::get("/move/{id}", "Settings\Leads@move")->where('id', '[0-9]+');
    Route::put("/move/{id}", "Settings\Leads@updateMove")->where('id', '[0-9]+');
    Route::delete("/statuses/{id}", "Settings\Leads@destroyStatus")->where('id', '[0-9]+')->middleware(['demoModeCheck']);
    Route::post("/update-stage-positions", "Settings\Leads@updateStagePositions");
});

//SETTINGS - MILESTONES
Route::group(['prefix' => 'settings/milestones'], function () {
    Route::get("/settings", "Settings\Milestones@index")->middleware(['demoModeCheck'])->name('settings.milestones.index');
    Route::put("/settings", "Settings\Milestones@update")->middleware(['demoModeCheck'])->name('settings.milestones.update');
    Route::get("/default", "Settings\Milestones@categories")->name('settings.milestones.categories');
    Route::get("/create", "Settings\Milestones@create")->name('settings.milestones.create');
    Route::post("/create", "Settings\Milestones@storeCategory")->middleware(['demoModeCheck'])->name('settings.milestones.storeCategory');
    Route::get("/{id}/edit", "Settings\Milestones@editCategory")->where('id', '[0-9]+')->name('settings.milestones.editCategory');
    Route::put("/{id}", "Settings\Milestones@updateCategory")->where('id', '[0-9]+')->middleware(['demoModeCheck'])->name('settings.milestones.updateCategory');
    Route::post("/update-positions", "Settings\Milestones@updateCategoryPositions")->name('settings.milestones.updateCategoryPositions');
    Route::delete("/{id}", "Settings\Milestones@destroy")->where('id', '[0-9]+')->middleware(['demoModeCheck'])->name('settings.milestones.destroy');
});



//SETTINGS - knowledgebase
Route::group(['prefix' => 'settings/knowledgebase'], function () {
    Route::get("/settings", "Settings\Knowledgebase@index")->name('settings.knowledgebase.index');
    Route::put("/settings", "Settings\Knowledgebase@update")->middleware(['demoModeCheck'])->name('settings.knowledgebase.update');
    Route::get("/default", "Settings\Knowledgebase@categories")->name('settings.knowledgebase.categories');
    Route::get("/create", "Settings\Knowledgebase@create")->name('settings.knowledgebase.create');
    Route::post("/create", "Settings\Knowledgebase@storeCategory")->middleware(['demoModeCheck'])->name('settings.knowledgebase.storeCategory');
    Route::get("/{id}/edit", "Settings\Knowledgebase@editCategory")->where('id', '[0-9]+')->name('settings.knowledgebase.editCategory');
    Route::put("/{id}", "Settings\Knowledgebase@updateCategory")->where('id', '[0-9]+')->middleware(['demoModeCheck'])->name('settings.knowledgebase.updateCategory');
    Route::post("/update-positions", "Settings\Knowledgebase@updateCategoryPositions")->name('settings.knowledgebase.updateCategoryPositions');
    Route::delete("/{id}", "Settings\Knowledgebase@destroy")->where('id', '[0-9]+')->middleware(['demoModeCheck'])->name('settings.knowledgebase.destroy');
});

//SETTINGS - LEAD SOURCES
Route::group(['prefix' => 'settings/sources'], function () {
    Route::get("/", "Settings\Sources@index");
    Route::put("/", "Settings\Sources@update")->middleware(['demoModeCheck']);
});
Route::resource('settings/sources', 'Settings\Sources');

//SETTINGS - LEAD WEBFORMS
Route::group(['prefix' => 'settings/webforms'], function () {
    Route::get("/", "Settings\Webforms@index")->name('webforms.index');
    Route::put("/", "Settings\Webforms@update")->middleware(['demoModeCheck'])->name('webforms.update');
    Route::get("/{id}/embedcode", "Settings\Webforms@embedCode")->name('webforms.embedcode');
    Route::get("/{id}/assigned", "Settings\Webforms@assignedUsers")->name('webforms.assigned');
    Route::post("/{id}/assigned", "Settings\Webforms@updateAssignedUsers")->name('webforms.updateAssignedUsers');
});


Route::resource('settings/webforms', 'Settings\Webforms');

//WEBFORM - VIEW
Route::get("/webform/view/{id}", "Webform@showWeb")->name('webform.view');
Route::get("/webform/embed/{id}", "Webform@showWeb")->name('webform.embed');
Route::post("/webform/submit/{id}", "Webform@saveForm")->name('webform.submit');


//SETTINGS - LEAD FORM BUILDER
Route::group(['prefix' => 'settings/formbuilder'], function () {
    Route::get("/{id}/build", "Settings\Formbuilder@buildForm")->name('formbuilder.build');
    Route::post("/{id}/build", "Settings\Formbuilder@saveForm")->name('formbuilder.save');
    Route::get("/{id}/settings", "Settings\Formbuilder@formSettings")->name('formbuilder.settings');
    Route::post("/{id}/settings", "Settings\Formbuilder@saveSettings")->name('formbuilder.saveSettings');
    Route::get("/{id}/integrate", "Settings\Formbuilder@embedCode")->name('formbuilder.embed');
});


//SETTINGS - TASKS
Route::group(['prefix' => 'settings/tasks'], function () {
    Route::get("/", "Settings\Tasks@index")->name('settings.tasks.index');
    Route::put("/", "Settings\Tasks@update")->middleware(['demoModeCheck'])->name('settings.tasks.update');

    Route::get("/statuses", "Settings\Tasks@statuses")->name('settings.tasks.statuses');
    Route::put("/statuses", "Settings\Tasks@updateStatuses")->middleware(['demoModeCheck'])->name('settings.tasks.updateStatuses');
    Route::get("/statuses/{id}/edit", "Settings\Tasks@editStatus")->where('task', '[0-9]+')->name('settings.tasks.editStatus');
    Route::put("/statuses/{id}", "Settings\Tasks@updateStatus")->where('task', '[0-9]+')->middleware(['demoModeCheck'])->name('settings.tasks.updateStatus');
    Route::get("/statuses/create", "Settings\Tasks@createStatus")->name('settings.tasks.createStatus');
    Route::post("/statuses/create", "Settings\Tasks@storeStatus")->name('settings.tasks.storeStatus');
    Route::get("/move/{id}", "Settings\Tasks@move")->where('id', '[0-9]+')->name('settings.tasks.move');
    Route::put("/move/{id}", "Settings\Tasks@updateMove")->where('id', '[0-9]+')->name('settings.tasks.updateMove');
    Route::delete("/statuses/{id}", "Settings\Tasks@destroyStatus")->where('id', '[0-9]+')->middleware(['demoModeCheck'])->name('settings.tasks.destroyStatus');
    Route::post("/update-stage-positions", "Settings\Tasks@updateStagePositions")->name('settings.tasks.updateStagePositions');
});


//SETTINGS - EMAIL
Route::group(['prefix' => 'settings/email'], function () {
    Route::get("/general", "Settings\Email@general")->name('settings.email.general');
    Route::put("/general", "Settings\Email@updateGeneral")->middleware(['demoModeCheck'])->name('settings.email.updateGeneral');
    Route::get("/smtp", "Settings\Email@smtp")->middleware(['demoModeCheck'])->name('settings.email.smtp');
    Route::put("/smtp", "Settings\Email@updateSMTP")->middleware(['demoModeCheck'])->name('settings.email.updateSMTP');
    Route::get("/templates", "Settings\Emailtemplates@index")->name('settings.email.templates.index');
    Route::get("/templates/{id}", "Settings\Emailtemplates@show")->where('id', '[0-9]+')->name('settings.email.templates.show');
    Route::post("/templates/{id}", "Settings\Emailtemplates@update")->where('id', '[0-9]+')->middleware(['demoModeCheck'])->name('settings.email.templates.update');
    Route::get("/testemail", "Settings\Email@testEmail")->middleware(['demoModeCheck'])->name('settings.email.testemail');
    Route::post("/testemail", "Settings\Email@testEmailAction")->middleware(['demoModeCheck'])->name('settings.email.testemailaction');
    Route::get("/testsmtp", "Settings\Email@testSMTP")->middleware(['demoModeCheck'])->name('settings.email.testsmtp');
    Route::get("/queue", "Settings\Email@queueShow")->where('id', '[0-9]+')->name('settings.email.queue.show');
    Route::get("/queue/{id}", "Settings\Email@queueRead")->where('id', '[0-9]+')->name('settings.email.queue.read');
    Route::delete("/queue/{id}", "Settings\Email@queueDelete")->where('id', '[0-9]+')->name('settings.email.queue.delete');
    Route::delete("/queue/purge", "Settings\Email@queuePurge")->name('settings.email.queue.purge');
    Route::delete("/queue/requeue", "Settings\Email@queueReschedule")->name('settings.email.queue.requeue');
    Route::get("/log", "Settings\Email@logShow")->where('id', '[0-9]+')->name('settings.email.log.show');
    Route::get("/log/{id}", "Settings\Email@logRead")->where('id', '[0-9]+')->name('settings.email.log.read');
    Route::delete("/log/{id}", "Settings\Email@logDelete")->where('id', '[0-9]+')->name('settings.email.log.delete');
    Route::delete("/log/purge", "Settings\Email@logPurge")->name('settings.email.log.purge');
});


//SETTINGS - UPDATES
Route::group(['prefix' => 'settings/updates'], function () {
    Route::get("/", "Settings\Updates@index")->name('settings.updates.index');
    Route::post("/check", "Settings\Updates@checkUpdates")->name('settings.updates.check');
});


//SETTINGS - RECAPCHA
Route::group(['prefix' => 'settings/recaptcha'], function () {
    Route::get("/", "Settings\Captcha@index")->name('settings.recaptcha.index');
    Route::put("/", "Settings\Captcha@update")->name('settings.recaptcha.update');
});


//SETTINGS - TWEAK
Route::group(['prefix' => 'settings/tweak'], function () {
    Route::get("/", "Settings\Tweak@index")->name('settings.tweak.index');
    Route::put("/", "Settings\Tweak@update")->middleware(['demoModeCheck'])->name('settings.tweak.update');
});


//SETTINGS - ROLES
Route::group(['prefix' => 'settings/roles'], function () {
    Route::get("/", "Settings\Roles@index")->name('settings.roles.index');
    Route::put("/", "Settings\Roles@update")->middleware(['demoModeCheck'])->name('settings.roles.update');
    Route::get("/{id}/homepage", "Settings\Roles@editHomePage")->where('id', '[0-9]+')->name('settings.roles.editHomepage');
    Route::put("/{id}/homepage", "Settings\Roles@updateHomePage")->middleware(['demoModeCheck'])->name('settings.roles.updateHomepage');
});

Route::resource('settings/roles', 'Settings\Roles');
Route::post("/settings/roles", "Settings\Roles@store")->middleware(['demoModeCheck'])->name('settings.roles.store');

//SETTINGS - CLIENTS
Route::group(['prefix' => 'settings/clients'], function () {
    Route::get("/", "Settings\Clients@index")->name('settings.clients.index');
    Route::put("/", "Settings\Clients@update")->middleware(['demoModeCheck'])->name('settings.clients.update');
});


//SETTINGS - TICKETS
Route::group(['prefix' => 'settings/tickets'], function () {
    Route::get("/", "Settings\Tickets@index")->name('settings.tickets.index');
    Route::put("/", "Settings\Tickets@update")->middleware(['demoModeCheck'])->name('settings.tickets.update');
    Route::get("/statuses", "Settings\Tickets@statuses")->name('settings.tickets.statuses');
    Route::put("/statuses", "Settings\Tickets@updateStatuses")->middleware(['demoModeCheck'])->name('settings.tickets.updateStatuses');
    Route::get("/statuses/{id}/edit", "Settings\Tickets@editStatus")->where('task', '[0-9]+')->name('settings.tickets.editStatus');
    Route::put("/statuses/{id}", "Settings\Tickets@updateStatus")->where('task', '[0-9]+')->middleware(['demoModeCheck'])->name('settings.tickets.updateStatus');
    Route::get("/statuses/create", "Settings\Tickets@createStatus")->name('settings.tickets.createStatus');
    Route::post("/statuses/create", "Settings\Tickets@storeStatus")->name('settings.tickets.storeStatus');
    Route::get("/move/{id}", "Settings\Tickets@move")->where('id', '[0-9]+')->name('settings.tickets.move');
    Route::put("/move/{id}", "Settings\Tickets@updateMove")->where('id', '[0-9]+')->name('settings.tickets.updateMove');
    Route::delete("/statuses/{id}", "Settings\Tickets@destroyStatus")->where('id', '[0-9]+')->middleware(['demoModeCheck'])->name('settings.tickets.destroyStatus');
    Route::post("/update-stage-positions", "Settings\Tickets@updateStagePositions")->name('settings.tickets.updateStagePositions');
    Route::get("/statuses/{id}/settings", "Settings\Tickets@statusSettings")->name('settings.tickets.statusSettings');
    Route::put("/statuses/{id}/settings", "Settings\Tickets@statusSettingsUpdate")->name('settings.tickets.statusSettingsUpdate');
});


//SETTINGS - LOGO
Route::group(['prefix' => 'settings/logos'], function () {
    Route::get("/", "Settings\Logos@index")->name('settings.logos.index');
    Route::get("/uploadlogo", "Settings\Logos@logo")->name('settings.logos.uploadlogo');
    Route::put("/uploadlogo", "Settings\Logos@updateLogo")->middleware(['demoModeCheck'])->name('settings.logos.updatelogo');
});


//SETTINGS - DYNAMIC URLS's
Route::group(['prefix' => 'app/settings'], function () {
    Route::get("/{any}", "Settings\Dynamic@showDynamic")->where(['any' => '.*'])->name('app.settings.dynamic');
});
Route::get("app/categories", "Settings\Dynamic@showDynamic")->name('app.categories.dynamic');
Route::get("app/tags", "Settings\Dynamic@showDynamic")->name('app.tags.dynamic');


//SETTINGS - CRONJOBS
Route::get("/settings/cronjobs", "Settings\Cronjobs@index")->name('settings.cronjobs.index');

//SETTINGS - TASKS
Route::group(['prefix' => 'settings/subscriptions'], function () {
    Route::get("/plans", "Settings\Subscriptions@plans")->name('settings.subscriptions.plans');
    Route::get("/plans/create", "Settings\Subscriptions@createPlan")->name('settings.subscriptions.createPlan');
    Route::post("/plans", "Settings\Subscriptions@storePlan")->middleware(['demoModeCheck'])->name('settings.subscriptions.storePlan');
    Route::put("/plans", "Settings\Subscriptions@updatePlan")->middleware(['demoModeCheck'])->name('settings.subscriptions.updatePlan');
});


Route::group(['prefix' => 'settings/customfields'], function () {
    Route::get("/clients", "Settings\Customfields@showClient")->name('settings.customfields.clients.show');
    Route::put("/clients", "Settings\Customfields@updateClient")->name('settings.customfields.clients.update');
    Route::get("/projects", "Settings\Customfields@showProject")->name('settings.customfields.projects.show');
    Route::put("/projects", "Settings\Customfields@updateProject")->name('settings.customfields.projects.update');
    Route::get("/leads", "Settings\Customfields@showLead")->name('settings.customfields.leads.show');
    Route::put("/leads", "Settings\Customfields@updateLead")->name('settings.customfields.leads.update');
    Route::get("/tasks", "Settings\Customfields@showTask")->name('settings.customfields.tasks.show');
    Route::put("/tasks", "Settings\Customfields@updateTask")->name('settings.customfields.tasks.update');
    Route::get("/tickets", "Settings\Customfields@showTicket")->name('settings.customfields.tickets.show');
    Route::put("/tickets", "Settings\Customfields@updateTicket")->name('settings.customfields.tickets.update');
    Route::delete("/{id}", "Settings\Customfields@destroy")->where('id', '[0-9]+')->name('settings.customfields.destroy');
    Route::get("/standard-form", "Settings\Customfields@showStandardForm")->name('settings.customfields.standard-form.show');
    Route::put("/standard-form-required", "Settings\Customfields@updateStandardFormRequired")->name('settings.customfields.standard-form.required');
    Route::post("/update-standard-form-positions", "Settings\Customfields@updateFieldPositions")->name('settings.customfields.standard-form.update-positions');
    Route::put("/standard-form-display-settings", "Settings\Customfields@updateDisplaySettings")->name('settings.customfields.standard-form.display-settings');
});


//SETTINGS - ERROR LOGS
Route::group(['prefix' => 'settings/errorlogs'], function () {
    Route::get("/", "Settings\Errorlogs@index")->name('settings.errorlogs.index');
    Route::delete("delete", "Settings\Errorlogs@delete")->where('id', '[0-9]+')->name('settings.errorlogs.delete');
    Route::get("/download", "Settings\Errorlogs@download")->name('settings.errorlogs.download');
});

//SETTINGS - FILES
Route::group(['prefix' => 'settings/files'], function () {
    Route::get("/general", "Settings\Files@showGeneral")->name('settings.files.general');
    Route::put("/general", "Settings\Files@updateGeneral")->name('settings.files.updateGeneral');
    Route::get("/folders", "Settings\Files@folders")->name('settings.files.folders');
    Route::put("/folders", "Settings\Files@updatefolders")->middleware(['demoModeCheck'])->name('settings.files.updateFolders');
    Route::get("/defaultfolders", "Settings\Files@defaultFolders")->name('settings.files.defaultFolders');
    Route::post("/defaultfolders", "Settings\Files@defaultFoldersStore")->name('settings.files.defaultFoldersStore');
    Route::get("/defaultfolders/create", "Settings\Files@createFolder")->name('settings.files.createFolder');
    Route::post("/defaultfolders/create", "Settings\Files@storeFolder")->name('settings.files.storeFolder');
    Route::get("/defaultfolders/{folder}/edit", "Settings\Files@editFolder")->where('folder', '[0-9]+')->name('settings.files.editFolder');
    Route::put("/defaultfolders/{folder}", "Settings\Files@updateFolder")->where('folder', '[0-9]+')->name('settings.files.updateFolder');
    Route::delete("/defaultfolders/{folder}", "Settings\Files@deleteFolder")->where('folder', '[0-9]+')->name('settings.files.deleteFolder');
});

//EVENTS - TIMELINE
Route::group(['prefix' => 'events'], function () {
    Route::get("/topnav", "Events@topNavEvents")->name('events.topnav');
    Route::get("/{id}/mark-read-my-event", "Events@markMyEventRead")->where('id', '[0-9]+')->name('events.markReadMyEvent');
    Route::get("/mark-allread-my-events", "Events@markAllMyEventRead")->name('events.markAllReadMyEvents');
});


//WEBHOOKS & IPN API
Route::group(['prefix' => 'api'], function () {
    Route::any("/stripe/webhooks", "API\Stripe\Webhooks@index")->name('api.stripe.webhooks');
    Route::any("/paypal/ipn", "API\Paypal\Ipn@index")->name('api.paypal.ipn');
    Route::any("/mollie/webhooks", "API\Mollie\Webhooks@index")->name('api.mollie.webhooks');
    Route::any("/paystack/webhooks", "API\Paystack\Webhooks@index")->name('api.paystack.webhooks');
});


//POLLING
Route::group(['prefix' => 'polling'], function () {
    Route::get("/general", "Polling@generalPoll")->name('polling.general');
    Route::post("/timers", "Polling@timersPoll")->name('polling.timers');
    Route::get("/timer", "Polling@activeTimerPoll")->name('polling.activeTimer');
});


Route::group(['prefix' => 'setup', 'as' => 'setup'], function () {
    // Requirements
    Route::post("/requirements", "Setup\Setup@checkRequirements")->middleware('memo')->name('requirements');

    // Server PHP info
    Route::get("/serverinfo", "Setup\Setup@serverInfo")->name('serverinfo');

    // Database
    Route::get("/database", "Setup\Setup@showDatabase")->name('database.show');
    Route::post("/database", "Setup\Setup@updateDatabase")->name('database.update');

    // Settings
    Route::get("/settings", "Setup\Setup@showSettings")->name('settings.show');
    Route::post("/settings", "Setup\Setup@updateSettings")->name('settings.update');

    // Admin user
    Route::get("/adminuser", "Setup\Setup@showUser")->name('adminuser.show');
    Route::post("/adminuser", "Setup\Setup@updateUser")->name('adminuser.update');

    // Load first page (put this as last item)
    Route::any("/", "Setup\Setup@index")->name('index');
});

//UPDATING MODALS
Route::group(['prefix' => 'updating'], function () {
    // Version 1.01 - January 2021
    Route::get("/update-currency-settings", "Updating\Action@showUpdatingCurrencySetting")->name('updating.currency.show');
    Route::put("/update-currency-settings", "Updating\Action@updateUpdatingCurrencySetting")->name('updating.currency.update');
});


// IMPORTING - COMMON
Route::post("/import/uploadfiles", "Fileupload@uploadImportFiles")->name('import.uploadfiles');
Route::get("/import/errorlog", "Import\Common@showErrorLog")->name('import.errorlog');

//IMPORT LEADS
Route::resource('import/leads', 'Import\Leads');

//IMPORT CLIENTS
Route::resource('import/clients', 'Import\Clients');

// EXPORT TICKETS
Route::post('export/tickets', 'Export\Tickets@index')->name('export.tickets');

// EXPORT CLIENTS
Route::post('export/clients', 'Export\Clients@index')->name('export.clients');

// EXPORT PROJECTS
Route::post('export/projects', 'Export\Projects@index')->name('export.projects');
//PROJECTS & PROJECT
Route::group(['prefix' => 'templates/projects'], function () {
    Route::any("/search", "Templates\Projects@index")->middleware(['projectTemplatesGeneral']);
    Route::post("/delete", "Templates\Projects@destroy")->middleware(['demoModeCheck']);
    Route::get("/{project}/project-details", "Templates\Projects@details")->middleware(['projectTemplatesGeneral']);
    Route::post("/{project}/project-details", "Templates\Projects@updateDescription");
    //dynamic load
    Route::any("/{project}/{section}", "Templates\Projects@showDynamic")
        ->where(['project' => '-[0-9]+', 'section' => 'details|files|tasks|milestones'])->middleware(['projectTemplatesGeneral']);
});
Route::resource('templates/projects', 'Templates\Projects')->middleware(['projectTemplatesGeneral']);

//REMINDERS
Route::group(['prefix' => 'reminders'], function () {
    Route::get("/start", "Reminders@show")->name('reminders.start');
    Route::get("/show", "Reminders@show")->name('reminders.show');
    Route::get("/edit", "Reminders@edit")->name('reminders.edit');
    Route::get("/new", "Reminders@create")->name('reminders.create');
    Route::post("/new", "Reminders@store")->name('reminders.store');
    Route::get("/close", "Reminders@close")->name('reminders.close');
    Route::get("/delete", "Reminders@delete")->name('reminders.delete');
    Route::get("/topnav-feed", "Reminders@topNavFeed")->name('reminders.topnav.feed');
    Route::get("/{id}/delete-reminder", "Reminders@deleteReminder")->name('reminders.delete.reminder');
    Route::get("/delete-all-my-due-reminders", "Reminders@deleteAllReminders")->name('reminders.delete.all');
});


//WEBMAIL
Route::get("/appwebmail/compose", "Webmail\Compose@compose")->name('webmail.compose');
Route::post("/appwebmail/send", "Webmail\Compose@send")->middleware(['demoModeCheck'])->name('webmail.send');
Route::get("/appwebmail/prefill", "Webmail\Compose@prefillTemplate")->name('webmail.prefill');

//SETTINGS - CLIENT EMAIL TEMPLATES
Route::resource('settings/webmail/templates', 'Settings\WebmailTemplates');

//REPORTING
Route::group(['prefix' => 'reports'], function () {
    Route::get("/reports", "Reports\Dynamic@showDynamic")->name('reports.index');

Route::any("/reports/{section}/{optional?}", "Reports\Dynamic@showDynamic")
    ->where('section', 'start|invoices|estimates|projects|clients|expenses|proposals|timesheets|financial')
    ->where('optional', '.*')
    ->name('reports.dynamic');

});


Route::group(['prefix' => 'report'], function () {
    Route::get("/start", "Reports\Start@showStart")->name('report.start');

    // Invoices
    Route::any("/invoices/overview", "Reports\Invoices@overview")->name('report.invoices.overview');
    Route::any("/invoices/month", "Reports\Invoices@month")->name('report.invoices.month');
    Route::any("/invoices/client", "Reports\Invoices@client")->name('report.invoices.client');
    Route::any("/invoices/project", "Reports\Invoices@project")->name('report.invoices.project');
    Route::any("/invoices/category", "Reports\Invoices@category")->name('report.invoices.category');

    // Estimates
    Route::any("/estimates/overview", "Reports\Estimates@overview")->name('report.estimates.overview');
    Route::any("/estimates/month", "Reports\Estimates@month")->name('report.estimates.month');
    Route::any("/estimates/client", "Reports\Estimates@client")->name('report.estimates.client');
    Route::any("/estimates/project", "Reports\Estimates@project")->name('report.estimates.project');
    Route::any("/estimates/category", "Reports\Estimates@category")->name('report.estimates.category');
    Route::any("/estimates/projectcategory", "Reports\Estimates@projectcategory")->name('report.estimates.projectcategory');

    // Projects
    Route::any("/projects/overview", "Reports\Projects@overview")->name('report.projects.overview');
    Route::any("/projects/client", "Reports\Projects@client")->name('report.projects.client');
    Route::any("/projects/project", "Reports\Projects@project")->name('report.projects.project');
    Route::any("/projects/category", "Reports\Projects@category")->name('report.projects.category');
    Route::any("/projects/projectcategory", "Reports\Projects@projectcategory")->name('report.projects.projectcategory');

    // Clients
    Route::any("/clients/overview", "Reports\Clients@overview")->name('report.clients.overview');

    // Timesheets
    Route::any("/timesheets/team", "Reports\Timesheets@team")->name('report.timesheets.team');
    Route::any("/timesheets/client", "Reports\Timesheets@client")->name('report.timesheets.client');
    Route::any("/timesheets/project", "Reports\Timesheets@project")->name('report.timesheets.project');

    // Financial
    Route::any("/financial/income-expenses", "Reports\IncomeStatement@report")->name('report.financial.income-expenses');

    // Expenses
    Route::any("/expenses/client", "Reports\Expenses@client")->name('report.expenses.client');
    Route::any("/expenses/project", "Reports\Expenses@project")->name('report.expenses.project');

    // Proposals
    Route::any("/proposals/client", "Reports\Proposals@client")->name('report.proposals.client');
});




//SPACES
Route::group(['prefix' => 'spaces'], function () {
    // Dynamic load
    Route::any("/{space}/{section}", "Spaces@showDynamic")
        ->where(['section' => 'comments|files|notes'])
        ->name('spaces.dynamic');

    Route::any("/{space}", "Spaces@showDynamic")->name('spaces.dynamic.space');
});


//MESSAGES
Route::group(['prefix' => 'messages'], function () {
    Route::any("/", "Messages@index")->name('messages.index');
    Route::post("/feed", "Messages@getFeed")->name('messages.feed');
    Route::post("/post/text", "Messages@storeText")->name('messages.storeText');
    Route::delete("/{message}", "Messages@destroy")->name('messages.destroy');
    Route::post("/fileupload", "Messages@storeFiles")->name('messages.storeFiles');
});


//USER PREFERENCES
Route::group(['prefix' => 'preferences'], function () {
    // Table display config
    Route::post("/tables", "Preferences@updateTableConfig")->name('preferences.updateTableConfig');
});

/**----------------------------------------------------------------------------------------------------------------
 * [GROWCRM - CUSTOM ROUTES]
 * ---------------------------------------------------------------------------------------------------------------*/

//AFFILIATES - USERS
Route::group(['prefix' => 'cs/affiliates/users'], function () {

    // Ruta para mostrar el formulario de cambio de contraseña para un usuario específico
    Route::get("/{id}/changepassword", "CS_Affiliates\Users@editPassword")
        ->where('id', '[0-9]+')
        ->name('cs.affiliate.users.editpassword');

    // Ruta para procesar el cambio de contraseña de un usuario específico
    Route::put("/{id}/changepassword", "CS_Affiliates\Users@updatePassword")
        ->where('id', '[0-9]+')
        ->name('cs.affiliate.users.updatepassword');
});


// Resourceful routes for managing users
Route::resource('cs/affiliates/users', 'CS_Affiliates\Users');

//AFFILIATES - PROJECTS
Route::group(['prefix' => 'cs/affiliates/projects'], function () {

});
Route::resource('cs/affiliates/projects', 'CS_Affiliates\Projects');

//AFFILIATES - EARNINGS
Route::group(['prefix' => 'cs/affiliates/earnings'], function () {

});
Route::resource('cs/affiliates/earnings', 'CS_Affiliates\Earnings');

//AFFILATE PROFIT
Route::get("/cs/affiliate/my/earnings", "CS_Affiliates\Profit@index")->name('cs.affiliate.earnings');

//Ruta de pruebas
Route::get('/prueba' ,'PerseoPc\Prueba@pruebaF') ;
