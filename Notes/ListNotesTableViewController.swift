//
//  ViewController.swift
//  Notes
//
//  Created by Patrick Nugros on 2/11/17.
//  Copyright © 2017 Patrick Nugros. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
    
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var note = Note()
        note.noteTitle = "Judul"
        note.noteDetail = "Detail"
        
        notes.append(note)
    }
    
    @IBAction func addNote(_ sender: Any) {
        
    }
    
    @IBAction func unwindToListNotesTableViewController(_ segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! NotesTableViewCell
        
        let note = notes[indexPath.row]
        
        cell.noteTitleLabel.text = note.noteTitle
        cell.noteDetailLabel.text = note.noteDetail
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            notes.remove(at: indexPath.row)
            tableView.reloadData()
            
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let displayNoteViewController = segue.destination as! DisplayNoteViewController
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                displayNoteViewController.note = notes[tableView.indexPathForSelectedRow!.row]
                displayNoteViewController.index = tableView.indexPathForSelectedRow!.row
            } else if identifier == "composeNote" {
                print("Compose Note")
                var note = Note()
                note.noteTitle = ""
                note.noteDetail = ""
                displayNoteViewController.note = note
            }
        }
    }
}
