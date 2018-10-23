
CKEDITOR.dialog.add('FileManagerDialog', function (editor) {
    return {
        title: 'File Manager',
        minWidth: 650,
        minHeight: 400, 
        contents: [
					{
					    id: 'tab1',
					    padding: 0,
					    height: 410,
                        width: 660,
					    elements:
						[
							{
							    type: 'html',
							    html: '<iframe id="iframeFile" src="/FileManager/default.aspx?function=_loadValue&mode=single&share=share&i=" style="border:0; width: 900px !important; height: 700px"></iframe>'
							}
						]
					}
        ],
        onLoad: function () {  
            fmClient.IsEditor = true; 
            fmClient.SelectedControl = editor.name;
        },
        buttons: [], 
        onOk: function () { 
             
        }
    };
});