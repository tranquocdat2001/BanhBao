CKEDITOR.plugins.add('box', {

    init: function (editor) {
        //editor.addCommand('dvs.image', new CKEDITOR.dialogCommand('FileManagerDialog'));
        editor.ui.addButton('box', {
            label:' Chèn box',
            command: 'box',
            toolbar: 'insert',
            icon: this.path + 'icons/box.png',
            click: function (editor) { window.open('/scripts/ckeditor/InsertBox.htm', 'box', 'width=400,height=300,scrollbars,resizable=yes,status=yes'); }
        });

        //CKEDITOR.dialog.add('FileManagerDialog', this.path + 'dialogs/dvs.image.js');
    }
});





