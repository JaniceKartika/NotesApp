//
//  DisplayNoteViewController.swift
//  Notes
//
//  Created by Patrick Nugros on 2/11/17.
//  Copyright © 2017 Patrick Nugros. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note : Note?
    var index = -1
    
    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteDetail: UITextField!
    
    @IBAction func cancelNote(_ sender: Any) {
        
    }
    
    @IBAction func saveNote(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let note = note {
            noteTitle.text = note.noteTitle
            noteDetail.text = note.noteDetail
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listNotesTableViewController = segue.destination as! ListNotesTableViewController

        
        if let identifier = segue.identifier {
            if identifier == "saveNote" {
                if note != nil {
                    if index == -1 {
                        note?.noteTitle = noteTitle.text ?? "Empty Note"
                        note?.noteDetail = noteDetail.text ?? "Empty Note"
                        listNotesTableViewController.notes.append(note!)
                    } else {
                        note?.noteTitle = noteTitle.text ?? "Empty Note"
                        note?.noteDetail = noteDetail.text ?? "Empty Note"
                        listNotesTableViewController.notes[index] = note!
                    }
                } else {
                    print("Note is empty")
                }
            } else if identifier == "cancelNote" {
                print("Cancel create or edit note")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
