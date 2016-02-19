/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pck.database;

import java.sql.Connection;
import pck.Bean.Book;
import pck.Bean.Person;

/**
 *
 * @author can
 * veritabanı implementasyonu
 */
public interface ImpDatabase {
    public Connection getConnection(String connection,String user,String password);
    public boolean InsertPerson(Person person);
    public void InsertBook(Book book);
    public void SelectBook(int id);
}
