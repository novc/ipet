package com.mall.dao;

import java.util.List;

public interface AdminNoteDao {

	public List getAllNotes();
	public boolean deleteNote(int[] i);
}
