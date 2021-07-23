/**
 * @license Copyright (c) 2003-2021, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';

    config.filebrowserUploadUrl = '/upload.do?type=Files',
        config.filebrowserImageUploadUrl = '/upload.do?type=Images',
        config.filebrowserUploadMethod = 'form'; //파일 오류났을때 alert띄워줌
};
