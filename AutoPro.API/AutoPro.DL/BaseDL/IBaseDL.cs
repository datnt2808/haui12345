using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.DL.BaseDL
{
    public interface IBaseDL<T>
    {
        /// <summary>
        /// Lấy tất cả bản ghi
        /// </summary>
        /// <returns>Tất cả bản ghi của list</returns>
        public List<T> GetAllRecord();

        public object Filter(string? textSearch, long pageSize, long pageNumber);
        /// <summary>
        /// Lấy 1 bản ghi theo id
        /// </summary>
        /// <param name="idRecord">Lấy 1 bản ghi</param>
        /// <returns></returns>
        public T GetRecordByID(int idRecord);

        /// <summary>
        /// Thêm mới 1 bản ghi
        /// </summary>
        /// <param name="record">Bản ghi muốn thêm</param>
        /// <returns>
        /// 1: Insert thành công
        /// 0: Insert thất bại
        /// </returns>
        public int InsertRecord(T record);

        /// <summary>
        /// Sửa đổi 1 bản ghi
        /// </summary>
        /// <param name="record">Bản ghi muốn sửa</param>
        /// <param name="idRecord">Id cần sửa</param>
        /// <returns>
        /// 0: Sửa thất bại
        /// 1: Sửa thành công
        /// </returns>        
        public int UpdateRecord(T record, int idRecord);

        /// <summary>
        /// Bản ghi muốn xóa
        /// </summary>
        /// <param name="idRecord">Xóa bản ghi theo id</param>
        /// <returns>
        /// 0: Xóa thất bại
        /// 1: Xóa thành công
        /// </returns>
        public int DeleteRecord(int idRecord);
    }
}
