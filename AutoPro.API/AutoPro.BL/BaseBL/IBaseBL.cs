using AutoPro.Common.Entities.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.BaseBL
{
    public interface IBaseBL<T>
    {
        #region Method

        /// <summary>
        /// Lấy tất cả bản ghi
        /// </summary>
        /// <returns> Danh sách tất cả bản ghi </returns>
        public List<T> GetAllRecords();
        public object Filter(string? textSearch, long pageSize, long pageNumber);
        /// <summary>
        /// Lấy 1 bản ghi
        /// </summary>
        /// <param name="idRecord"> Id bản ghi cần lấy</param>
        /// <returns> Bản ghi <typeparamref name="T"/></returns>
        public T GetRecordByID(int idRecord);

        /// <summary>
        /// Thêm mới nhân viên
        /// </summary>
        /// <param name="record">Bản ghi muốn thêm mới</param>
        /// <returns>
        /// 1 : Insert thành công 
        /// 0 : Insert thất bại 
        /// </returns>
        public ServiceResult InsertRecord(T record);

        /// <summary>
        /// Cập nhập thông tin bản ghi
        /// </summary>
        /// <param name="record"> Thông tin bản ghi cần cập nhập </param>
        /// <param name="idRecord"> Id bản ghi cần cập nhập </param>
        /// <returns>Số bản ghi bị tác động</returns>
        public ServiceResult UpdateRecord(T record, int idRecord);

        /// <summary>
        /// Xóa một bản ghi
        /// </summary>
        /// <param name="idRecord"> id bản cần xóa </param>
        /// <returns>Số bản ghi bị tác động</returns>
        public ServiceResult DeleteRecord(int idRecord);
        #endregion
    }
}
