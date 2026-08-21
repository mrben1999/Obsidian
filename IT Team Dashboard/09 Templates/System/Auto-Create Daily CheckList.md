<%*
/*
  AUTO-CREATE DAILY CHECKLIST
  ---------------------------
  Template này KHÔNG dùng để mở tay. Nó được Templater tự động chạy
  MỖI KHI Obsidian khởi động (xem hướng dẫn cài đặt bên dưới), kiểm tra
  xem checklist của hôm nay đã tồn tại trong "00 Home/Daily CheckList"
  chưa — nếu chưa thì tự tạo mới từ template "Daily CheckList".
*/

const folderPath = "00 Home/Daily CheckList";
const fileName = tp.date.now("YYYY-MM-DD");
const fullPath = `${folderPath}/${fileName}.md`;

const existing = app.vault.getAbstractFileByPath(fullPath);

if (!existing) {
    const folder = app.vault.getAbstractFileByPath(folderPath);
    const templateFile = tp.file.find_tfile("Daily CheckList");

    if (templateFile) {
        const newNote = await tp.file.create_new(templateFile, fileName, false, folder);
        new Notice(`✅ Đã tạo Checklist hôm nay: ${fileName}`);
    } else {
        new Notice("⚠️ Không tìm thấy template 'Daily CheckList'. Kiểm tra lại đường dẫn 09 Templates/Daily-CheckList/.");
    }
} else {
    // Checklist hôm nay đã có sẵn — không làm gì cả.
}
-%>
