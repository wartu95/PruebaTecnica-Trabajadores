using System.ComponentModel.DataAnnotations;
namespace App_TrabajadoresPrueba.Models
{
    public class TrabajadorModel
    {
        [Display(Name = "Id")] public int id { get; set; }

        [Display(Name = "Tipo de Documento")] public string tipoDocumento { get; set; }

        [Display(Name = "Número de Documento")] public string numeroDocumento { get; set; }

        [Display(Name = "Nombres")] public string nombres { get; set; }

        [Display(Name = "Sexo")] public string sexo { get; set; }

        [Display(Name = "Departamento")] public int departamento { get; set; }

        [Display(Name = "Provincia")] public int provincia { get; set; }

        [Display(Name = "Distrito")] public int distrito { get; set; }

        // Listas para combos
        public List<Departamento> ListaDepartamentos { get; set; } = new();
        public List<Provincia> ListaProvincias { get; set; } = new();
        public List<Distrito> ListaDistritos { get; set; } = new();
    }

    public class Departamento
    {
        public int Id { get; set; }
        public string NombreDepartamento { get; set; } = string.Empty;
    }


    public class Provincia
    {
        public int Id { get; set; }
        public int IdDepartamento { get; set; }
        public string NombreProvincia { get; set; } = string.Empty;
    }


    public class Distrito
    {
        public int Id { get; set; }
        public int IdProvincia { get; set; }
        public string NombreDistrito { get; set; } = string.Empty;
    }
}
