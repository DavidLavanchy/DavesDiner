using Dapper;
using DataLibrary.db;
using DataLibrary.Models;
using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Data
{
    public class OrderData
    {
        private readonly IDataAccess _dataAccess;
        private readonly ConnectionStringData _connectionString;

        public OrderData(IDataAccess dataAccess, ConnectionStringData connectionString)
        {
            this._dataAccess = dataAccess;
            this._connectionString = connectionString;
        }

        public async Task<int> CreateOrder(OrderModel order)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("OrderName", order.OrderName);
            parameters.Add("OrderDate", order.OrderDate);
            parameters.Add("FoodId", order.FoodId);
            parameters.Add("Quantity", order.Quantity);
            parameters.Add("Total", order.Total);
            parameters.Add("Id", dbType: DbType.Int32, direction: ParameterDirection.Output);

            await _dataAccess.SaveData("dbo.spOrder_Insert", parameters, _connectionString.SqlConnectionName);

            return parameters.Get<int>("Id");
        }

        public Task<int> UpdateOrderName(int orderId, string orderName)
        {
            return _dataAccess.SaveData("dbo.spOrder_UpdateName", new {Id = orderId, OrderName = orderName}, _connectionString.SqlConnectionName);
        }

        public Task<int> DeleteOrder(int orderId)
        {
            return _dataAccess.SaveData("dbo.spOrder_Delete", new { Id = orderId }, _connectionString.SqlConnectionName);
        }

        public async Task<FoodModel> GetOrderById(int orderId)
        {
            var list = await _dataAccess.LoadData<FoodModel, dynamic>("dbo.spOrder_GetById", new { Id = orderId }, _connectionString.SqlConnectionName);
            return list.FirstOrDefault()!;
        }


    }
}
