$(function(){
    // 要素もろもろ初期設定
    let $table = $("#csv_data");
    let $table_body = $table.children('tbody');
    let $fixed = $("#data_result");
    let fileArea = $('drop_zone');

    // CSVデータレコード出力タグ生成
    function funcAppendTag(item){
        let appendTag = '';
        appendTag += '<tr class="record" data-member="' + item[0] + '">';
        appendTag +=  '<td>' + item[0] + '</td>';
        appendTag +=  '<td>' + item[1] + '</td>';
        appendTag +=  '<td>' + item[2] + '</td>';
        appendTag +=  '<td>' + item[3] + '</td>';
        // 値が空だと"null"で返ってくるので文字列的に空にしたりする
        if(item[4] == null){
            appendTag +=  '<td></td>';
        }else{
            appendTag +=  '<td>' + item[4] + '</td>';
        }
        appendTag +=  '</tr>';
        return appendTag;
    }

    // CSVファイルのドロップ処理
    fileArea.addEventListener('dragover', function(evt){
        evt.preventDefault();
        fileArea.classList.add('dragover');
    });
    fileArea.addEventListener('dragleave', function(evt){
        evt.preventDefault();
        fileArea.classList.remove('dragover');
    });
    fileArea.addEventListener('drop', function(evt){
        evt.preventDefault();
        // table内を一旦空にする
        $table_body.empty();
        var files = evt.dataTransfer.files;
        // CSVファイル以外は許可しない
        if (files[0]['type'] != "application/vnd.ms-excel") {
            alert("This is not a CSV file.");
        }else{
            // ファイルを一時的にアップロードしてデータを出力
            var formData = new FormData($("#csv_form").get(0));
            $.ajax({
                url  : "/data_result", // 次のアクション先を指定
                type : "POST",
                data : formData,  // フォーム内のデータ
                cache       : false,
                contentType : false,
                processData : false,  // これないと多分rails側で弾かれる
                dataType    : "json" // レスポンスはJSON形式で受け取る
            }).done(function(data, textStatus, jqXHR){
                // レスポンスが無かったりデータ破損を念のため警告
                if (!Object.keys(data).length) {
                    alert("CSVファイルがShift_JIS形式でない、または壊れている可能性があります。")
                }else{
                    // csvレコードをtableタグ出力
                    $.each(data, function(i, item) {
                        appendTag = funcAppendTag(item);
                        $table_body.append(appendTag);
                    });
                }
                console.log(data);
                open_file.text(name);
            }).fail(function(jqXHR, textStatus, errorThrown){
                alert("CSVファイルの取得に失敗しました");
            });
        }
    });
});
