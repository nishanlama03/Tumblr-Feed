//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Nishan Lama on 4/9/25.
//
import Nuke
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailContext: UILabel!
    
    @IBOutlet weak var posterImage: UIImageView!
    var post: Post!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailContext.text = post.caption.stripHTMLTags()

        
        if let photo = post.photos.first {
            let url = photo.originalSize.url
            Nuke.loadImage(with: url, into: posterImage)
        }
        

        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension String {
    func stripHTMLTags() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        let attributed = try? NSAttributedString(data: data, options: options, documentAttributes: nil)
        return attributed?.string ?? self
    }
}
