using App_TrabajadoresPrueba.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System.Data;

namespace App_TrabajadoresPrueba.Controllers
{
    public class TrabajadoresController : Controller
    {
        public readonly IConfiguration _config;
        public TrabajadoresController(IConfiguration IConfig)
        {
            _config = IConfig;
        }

        private List<Departamento> ListaDepartamentos()
        {
            List<Departamento> lista = new List<Departamento>();
            using (SqlConnection cn = new SqlConnection(_config["ConnectionStrings:sqlConUser"]))
            {
                SqlCommand cmd = new SqlCommand("usp_ListaDepartamentos", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lista.Add(new Departamento { Id = dr.GetInt32(0), NombreDepartamento = dr.GetString(1) });
                }
            }
            return lista;
        }

        private List<Provincia> ListaProvincia(int departamentoId)
        {
            List<Provincia> lista = new List<Provincia>();
            using (SqlConnection cn = new SqlConnection(_config["ConnectionStrings:sqlConUser"]))
            {
                SqlCommand cmd = new SqlCommand("usp_ListaProvincias_Departamento", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdDepartamento", departamentoId);
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lista.Add(new Provincia { Id = dr.GetInt32(0), NombreProvincia = dr.GetString(1) });
                }
            }
            return lista;
        }

        private List<Distrito> ListaDistrito(int provinciaId)
        {
            List<Distrito> lista = new List<Distrito>();
            using (SqlConnection cn = new SqlConnection(_config["ConnectionStrings:sqlConUser"]))
            {
                SqlCommand cmd = new SqlCommand("usp_ListaDistritos_Provincia", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdProvincia", provinciaId);
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lista.Add(new Distrito { Id = dr.GetInt32(0), NombreDistrito = dr.GetString(1) });
                }
            }
            return lista;
        }


        IEnumerable<TrabajadorModel> listado()
        {
            List<TrabajadorModel> trabajadores = new List<TrabajadorModel>();
            using (SqlConnection cn = new SqlConnection(_config["ConnectionStrings:sqlConUser"]))
            {
                SqlCommand cmd = new SqlCommand("exec usp_ListarTodosTrabajadores", cn);
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    trabajadores.Add(new TrabajadorModel()
                    {
                        id = dr.GetInt32(0),
                        tipoDocumento = dr.GetString(1),
                        numeroDocumento = dr.GetString(2),
                        nombres = dr.GetString(3),
                        sexo = dr.GetString(4),
                        departamento = dr.GetInt32(5),
                        provincia = dr.GetInt32(6),
                        distrito = dr.GetInt32(7)
                    });
                }
            }
            return trabajadores;
        }

        public async Task<IActionResult> Index()
        {
            return View(await Task.Run(() => listado()));
        }


        public async Task<IActionResult> Create()
        {
            var modelo = new TrabajadorModel
            {
                ListaDepartamentos = ListaDepartamentos(),
                ListaProvincias = new List<Provincia>(), 
                ListaDistritos = new List<Distrito>()
            };
            return View(modelo);
        }

        TrabajadorModel Buscar(int id)
        {
            TrabajadorModel? reg = listado().Where(v => v.id == id).FirstOrDefault();
            return reg;
        }

        [HttpPost]
        public async Task<IActionResult> Create(TrabajadorModel trabajador)
        {
            if (ModelState.IsValid)
            {

                using (SqlConnection cn = new SqlConnection(_config["ConnectionStrings:sqlConUser"]))
                {

                    SqlCommand cmd = new SqlCommand("usp_CrearTrabajador", cn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@tipoDocumento", trabajador.tipoDocumento);
                    cmd.Parameters.AddWithValue("@numeroDocumento", trabajador.numeroDocumento);
                    cmd.Parameters.AddWithValue("@nombres", trabajador.nombres);
                    cmd.Parameters.AddWithValue("@sexo", trabajador.sexo);
                    cmd.Parameters.AddWithValue("@IdDepartamento", trabajador.departamento);
                    cmd.Parameters.AddWithValue("@IdProvincia", trabajador.provincia);
                    cmd.Parameters.AddWithValue("@IdDistrito", trabajador.distrito);
                    cn.Open();
                    int c = cmd.ExecuteNonQuery();
                }
                return RedirectToAction("Index");
            }
            trabajador.ListaDepartamentos = ListaDepartamentos();
            trabajador.ListaProvincias = ListaProvincia(trabajador.departamento);
            trabajador.ListaDistritos = ListaDistrito(trabajador.provincia);
            return View(trabajador);

        }

        public async Task<IActionResult> Edit(int id)
        {
            TrabajadorModel reg = Buscar(id);
            if (reg == null)
            {
                return RedirectToAction("Index");
            }

            reg.ListaDepartamentos = ListaDepartamentos();
            reg.ListaProvincias = ListaProvincia(reg.departamento);
            reg.ListaDistritos = ListaDistrito(reg.provincia);

            return View(reg); ;
        }

        [HttpPost]
        public async Task<IActionResult> Edit(TrabajadorModel trabajador)
        {
            if (ModelState.IsValid)
            {
                using (SqlConnection cn = new SqlConnection(_config["ConnectionStrings:sqlConUser"]))
                {
                    SqlCommand cmd = new SqlCommand("usp_ActualizarTrabajador", cn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", trabajador.id);
                    cmd.Parameters.AddWithValue("@tipoDocumento", trabajador.tipoDocumento);
                    cmd.Parameters.AddWithValue("@numeroDocumento", trabajador.numeroDocumento);
                    cmd.Parameters.AddWithValue("@nombres", trabajador.nombres);
                    cmd.Parameters.AddWithValue("@sexo", trabajador.sexo);
                    cmd.Parameters.AddWithValue("@IdDepartamento", trabajador.departamento);
                    cmd.Parameters.AddWithValue("@IdProvincia", trabajador.provincia);
                    cmd.Parameters.AddWithValue("@IdDistrito", trabajador.distrito);
                    cn.Open();
                    int c = cmd.ExecuteNonQuery();
                }
                return RedirectToAction("Index");
            }
            trabajador.ListaDepartamentos = ListaDepartamentos();
            trabajador.ListaProvincias = ListaProvincia(trabajador.departamento);
            trabajador.ListaDistritos = ListaDistrito(trabajador.provincia);
            return View(trabajador);
        }


        public IActionResult Delete(int id)
        {
            SqlConnection cn = new SqlConnection(_config["ConnectionStrings:sqlConUser"].ToString());
            int resultado = 0;
            cn.Open();

                SqlCommand cmd = new SqlCommand("usp_EliminarTrabajador", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@id", id);

                resultado = cmd.ExecuteNonQuery();

                cn.Close();
            


            return RedirectToAction("index");
        }
    
    }
}
