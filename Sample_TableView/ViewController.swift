
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    //tableviewの宣言
    @IBOutlet var table: UITableView!
    
    //表に表示させる配列の宣言
    var letters:[String] = ["a", "b", "c", "d", "e"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource  = self
        table.delegate = self
    }
    
    //cellの数を指定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //cellの数を設定する
        return letters.count
    }
    
    //セルを取得、セルの見た目を決めて表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cellを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        //cellの中身（行数目はindexPath.rowで取得できる）
        cell?.textLabel?.text = letters[indexPath.row]
        
        //cellを指定する（表示させる感じ）
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        // 先にデータを削除しないと、エラーが発生します。
        //データを削除するコード
        letters.remove(at: indexPath.row)
        
        //画面上で削除
        table.deleteRows(at: [indexPath], with: .automatic)
    }
    
    //セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //選択された時の処理を書く
        print("IndexPath.row: \(indexPath.row) has been selected!")
    }
}
