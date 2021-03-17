package utilitaire;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.Scanner;
import java.util.Vector;
import java.lang.reflect.*;
public abstract class AccesDonneeFichier2 implements AccesDonnee{
	public static String[] avoir (String nf) throws Exception{
		Scanner scanner = null;
		String [] res=null;
		Vector v=new Vector();
		try {
		scanner = new Scanner(new File(nf+".txt"));
			while (scanner.hasNextLine())
			{
					String line = scanner.nextLine();
					v.addElement(line);
			}
			res=new String[v.size()];
			v.copyInto(res); 
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return res;
	}

	public static void insert(String nt,Object o) throws Exception{
		try{			
			PrintWriter fw=new PrintWriter(new BufferedWriter(new FileWriter(new File(nt+".txt"),true)));
			//fw.println(txt);
			String req=new String();
			Colonne[] col=AccesDonneeFichier2.getStructure(nt);
			Class clas=o.getClass();
			int i=0;
			Method getter1=clas.getMethod("get"+col[0].getNm());
			String reference=new String();
			reference=(String)getter1.invoke(o);
			req=req+reference;
			for(i=1;i<col.length;i++)
			{
				Method getter2=clas.getMethod("get"+col[i].getNm());
				String reference1=new String();
				//System.out.println("get"+col[i].getNm());				
				reference1=(String)getter2.invoke(o);
				req=req+",,"+reference1+"\n";
				//System.out.println(reference1);
				
			}
			fw.println(req);
			fw.flush();
			fw.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			
		}
	}

	public static Colonne[] getStructure(String nf) throws Exception{
		Scanner scanner = null;
		int i=0;
		Vector v=new Vector();
		Colonne[] col=null;
	     try {
	     		String[] txt=avoir(nf);
	     		
	     		String [] txt1=txt[0].split(",,");
			     col=new Colonne[txt1.length];
			     for(int j=0;j<txt1.length;j++)
			     {
			     		Colonne c1=new Colonne(txt1[j]);
			     		col[j]=c1;
			     }
			 
		     }
	       catch (FileNotFoundException e) {
	           e.printStackTrace();
	       }
	       return col;
	}

	public static void update(String nf,int id,Object o) throws Exception{
		File tmp=new File(nf+".txt");
		String[] fil=avoir(nf);
		Vector v=new Vector();
		for(int i=0;i<fil.length;i++)
		{
			if(i!=id)
			{
				v.addElement(fil[i]);
			}
			if(i==id)
			{
				String req=new String();
				Colonne[] col=AccesDonneeFichier2.getStructure(nf);
				Class clas=o.getClass();
				int i2=0;
				Method getter1=clas.getMethod("get"+col[0].getNm());
				String reference=new String();
				reference=(String)getter1.invoke(o);
				req=req+reference;
				for(i2=1;i2<col.length;i2++)
				{
					Method getter2=clas.getMethod("get"+col[i2].getNm());
					String reference1=new String();			
					reference1=(String)getter2.invoke(o);
					req=req+",,"+reference1;
				}
				v.addElement(req);
			}
		}
		
		String[] fil1=new String[v.size()];
		v.copyInto(fil1);

		PrintWriter fw=new PrintWriter(new BufferedWriter(new FileWriter(tmp)));
		try{
				for(int i1=0;i1<fil1.length;i1++)
				{
					fw.println(fil1[i1]);
				}
				fw.flush();
		}
		catch(Exception e){}
		finally{fw.close();}
	}

	public static void delete(String nf,int id) throws Exception{
		File tmp=new File(nf+".txt");
		String[] fil=avoir(nf);
		Vector v=new Vector();
		for(int i=0;i<fil.length;i++)
		{
			if(i!=id)
			{
				v.addElement(fil[i]);
			}
		}
		String[] fil1=new String[v.size()];
		v.copyInto(fil1);
		PrintWriter fw=new PrintWriter(new BufferedWriter(new FileWriter(tmp)));
		try{
				
				for(int i1=0;i1<fil1.length;i1++)
				{
					fw.println(fil1[i1]);
				}
				fw.flush();
			}
			catch(Exception e){}
			finally{fw.close();}
		
	}

	public abstract void rechercher();
}