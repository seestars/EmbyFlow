#!/bin/sh

# 定义文件路径
html_file="/system/dashboard-ui/index.html"
insert_code="    <script src="./home.js"></script>"

# 判断文件是否存在
if [ -e "$html_file" ]; then
    # 检查是否已引入home.js
    if grep -q "home.js" "$html_file"; then
        echo "已成功引入，无需重复操作."
    else
        # 插入代码到 </body> 之前
        awk -v code="$insert_code" '/<\/body>/ {print code; print; next} 1' "$html_file" > "$html_file.tmp" && mv "$html_file.tmp" "$html_file"
        echo "已成功插入样式表和脚本到 $html_file."
    fi
else
    echo "$html_file 不存在,请根据自身情况修改脚本"
fi
