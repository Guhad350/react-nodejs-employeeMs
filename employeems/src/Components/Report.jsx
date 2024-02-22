import React, { useState, useEffect } from 'react';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Button, TextField } from '@mui/material';
import { Print as PrintIcon } from '@mui/icons-material';
import { styled } from '@mui/system'; // Use the styled function from @mui/system
import './Report.css';

const useStyles = {
  tableCell: {
    borderBottom: '1px solid #dee2e6',
    padding: '12px',
  },
  headerCell: {
    backgroundColor: '#f8f9fa',
    fontWeight: 'bold',
  },
  searchInput: {
    marginRight: '8px', // Use a fixed value or adjust as needed
  },
  printButton: {
    marginLeft: 'auto',
  },
};

const StyledTableCell = styled(TableCell)(useStyles.tableCell); // Apply styles using the styled function

const Report = () => {
  const [employees, setEmployees] = useState([]);
  const [currentDateTime, setCurrentDateTime] = useState('');
  const [searchQuery, setSearchQuery] = useState('');

  useEffect(() => {
    fetchEmployees();
    updateCurrentDateTime();
  }, []);

  const fetchEmployees = async () => {
    try {
      const response = await fetch('http://localhost:3000/auth/employee');
      const data = await response.json();

      if (data.Status) {
        setEmployees(data.Result);
      } else {
        console.error(data.Error);
      }
    } catch (error) {
      console.error('Error fetching employees:', error);
    }
  };

  const updateCurrentDateTime = () => {
    const now = new Date();
    const formattedDateTime = now.toLocaleString();
    setCurrentDateTime(formattedDateTime);
  };

  const handlePrint = () => {
    window.print();
  };

  const handleSearchChange = (event) => {
    setSearchQuery(event.target.value);
  };

  const filteredEmployees = employees.filter((employee) =>
    employee.name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <div className="report-container">
      <div className="header">
        <h3 style={{ textAlign: 'center' }}>Employee Report</h3>
        <div className="header-buttons">
          <TextField
            label="Search"
            variant="outlined"
            value={searchQuery}
            onChange={handleSearchChange}
            className={`search-input ${useStyles.searchInput}`}
          />
          <Button
            variant="contained"
            className={`print-button ${useStyles.printButton}`}
            color="primary"
            startIcon={<PrintIcon />}
            onClick={handlePrint}
          >
            Print
          </Button>
        </div>
      </div>
      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <StyledTableCell className={`${useStyles.headerCell}`}>ID</StyledTableCell>
              <StyledTableCell className={`${useStyles.headerCell}`}>Name</StyledTableCell>
              <StyledTableCell className={`${useStyles.headerCell}`}>Email</StyledTableCell>
              <StyledTableCell className={`${useStyles.headerCell}`}>Salary</StyledTableCell>
              <StyledTableCell className={`${useStyles.headerCell}`}>Address</StyledTableCell>
              <StyledTableCell className={`${useStyles.headerCell}`}>Date/Time</StyledTableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {filteredEmployees.map((employee) => (
              <TableRow key={employee.id}>
                <StyledTableCell>{employee.id}</StyledTableCell>
                <StyledTableCell>{employee.name}</StyledTableCell>
                <StyledTableCell>{employee.email}</StyledTableCell>
                <StyledTableCell>{employee.salary}</StyledTableCell>
                <StyledTableCell>{employee.address}</StyledTableCell>
                <StyledTableCell>{currentDateTime}</StyledTableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </div>
  );
};

export default Report;
