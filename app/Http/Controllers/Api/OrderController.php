<?php

namespace App\Http\Controllers\Api;

use App\Models\Order;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Order::with('car')->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'car_id' => 'required|exists:cars,car_id',
            'order_date' => 'required|date',
            'pickup_date' => 'required|date|after_or_equal:today',
            'dropoff_date' => 'required|date|after:pickup_date',
            'pickup_location' => 'required',
            'dropoff_location' => 'required'
        ]);

        $overlap = Order::where('car_id', $request->car_id)
            ->where(function ($query) use ($request) {
                $query->whereBetween('pickup_date', [$request->pickup_date, $request->dropoff_date])
                    ->orwhereBetween('dropoff_date', [$request->pickup_date, $request->dropoff_date])
                    ->orwhere(function ($query) use ($request) {
                        $query->where('pickup_date', '<=',$request->pickup_date)
                            ->where('dropoff_date', '>=',$request->dropoff_date);
                    });
            })->exists();

        if ($overlap) {
            return response()->json([
                'success' => false,
                'message' => 'Mobil sudah dipesan pada rentang tanggal tersebut.',
            ], 409);
        }

        // $validator->validate();

        $order = Order::create($request->all());

        return response()->json([
            'success' => true,
            'message' => 'Pemesanan berhasil disimpan.',
            'data' => $order
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Order $order)
    {
        return $order->load('car');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Order $order)
    {
        $order->update($request->all());
        return $order;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Order $order)
    {
        $order->delete();
        return response()->noContent();
    }
}
