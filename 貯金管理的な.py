import tkinter as tk

# アプリのウィンドウを作成
window = tk.Tk()
window.title("お年玉管理アプリ")

# ラベルを追加
label = tk.Label(window, text="お年玉管理")
label.pack()

# 金額の数値を出すためにamount.datをロード
def load_amount_from_file():
    try:
        with open("amount", "r") as file:
            return int(file.read())
    except FileNotFoundError:
        return 0

saved_amount = load_amount_from_file()

# 親に預けてる貯金額を出す
amount_label = tk.Label(window, text=f"貯金額: {saved_amount} 円")
amount_label.pack()

# 金額を入力するエントリーを追加
entry = tk.Entry(window)
entry.pack()

# 金額を更新する関数
def update_amount():
    try:
        # エントリーから金額を取得して整数に変換
        amount = int(entry.get())
        # ここで金額を管理するロジックを追加
        # 例: ファイルに金額を保存する
        with open("amount", "w") as file:
            file.write(str(amount))
        # 更新成功のメッセージを表示
        message_label.config(text="金額を更新しました！")
    except ValueError:
        # エラーメッセージを表示
        message_label.config(text="無効な金額です。")

# 更新ボタンを追加
update_button = tk.Button(window, text="更新", command=update_amount)
update_button.pack()

# メッセージを表示するラベルを追加
message_label = tk.Label(window, text="")
message_label.pack()

# アプリを実行
window.mainloop()
