CKEDITOR.plugins.add('dvs.image', {

    init: function (editor) {
	    //editor.addCommand('dvs.image', new CKEDITOR.dialogCommand('FileManagerDialog'));
		editor.ui.addButton( 'DVS.Image', {
			label: 'File Manager',
			command: 'dvs.image',
			toolbar: 'insert',
			icon: this.path + 'icons/dvs.image.png',
			click: function (editor) { window.open('/FileManager/default.aspx?function=InsertHTML&mode=single&share=share&i=', 'Image Browser', 'width=900,height=700,scrollbars,resizable=yes,status=yes'); }
		});
		 
		//CKEDITOR.dialog.add('FileManagerDialog', this.path + 'dialogs/dvs.image.js');
	}
});



