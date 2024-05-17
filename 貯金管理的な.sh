#!/bin/bash

# 貯金額をファイルから読み込む関数
load_amount() {
    if [ -f amount ]; then
        cat amount
    else
        echo 0
    fi
}

# 貯金額を表示する関数
show_amount() {
    amount=$(load_amount)
    echo "現在の貯金額は${amount}円です。"
}

# 貯金額を更新する関数
update_amount() {
    echo -n "追加する金額を入力してください: "
    read add_amount
    if [[ ! $add_amount =~ ^[0-9]+$ ]]; then
        echo "無効な金額です。数字を入力してください。"
        return
    fi
    new_amount=$(( $(load_amount) + add_amount ))
    echo $new_amount > amount
    echo "貯金額が更新されました。新しい貯金額は${new_amount}円です。"
}

# 貯金額を減らす関数
update_amounts() {
    echo -n "追加する金額を入力してください: "
    read add_amount
    if [[ ! $add_amount =~ ^[0-9]+$ ]]; then
        echo "無効な金額です。数字を入力してください。"
        return
    fi
    new_amount=$(( $(load_amount) - add_amount ))
    echo $new_amount > amount
    echo "貯金額が更新されました。新しい貯金額は${new_amount}円です。"
}

# メインメニュー
while true; do
    echo "1) 貯金額を表示"
    echo "2) 貯金額を更新"
    echo "3) 貯金額を消す"
    echo "4) 終了"
    echo -n "選択してください: "
    read choice
    case $choice in
        1) show_amount ;;
        2) update_amount ;;
        3) update_amounts ;;
        4) break ;;
        *) echo "無効な選択です。" ;;
    esac
done
